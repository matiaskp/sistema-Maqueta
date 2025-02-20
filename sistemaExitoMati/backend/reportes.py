import dash
from dash import dcc, html, Input, Output, dash_table
import plotly.express as px
import pandas as pd
import fdb
import webbrowser 
import threading
import os



con = fdb.connect(dsn='localhost:c:/recoder/icp/icp.fdb',user="sysdba",password="samurai",
fb_library_name="c:/recoder/fbclient64.dll")
print(con.version)

# Definir la aplicación Dash
app = dash.Dash(__name__)
correct1 = os.getenv('APP_PASSWORD', 'vaneexito')  
# Definir el layout de la aplicación
app.layout = html.Div(id='main-container', children=[
    # Sección de login
    html.Div(id='login-container', children=[
        html.H2('iniciar sesión'),
        dcc.Input(id='password-input', type='password', placeholder='Ingresar contraseña', style={'margin': '10px',"textAlign": "center"}),
        html.Button('Ingresar', id='login-button', n_clicks=0,style={"textAlign":"center","background-color":"green","color":"white"}),
        html.Div(id='login-message', style={'color': 'red', 'textAlign': 'center'}),
    ]),
    
    # Sección principal (oculta hasta que el usuario inicie sesión)
    html.Div(id='app-container', style={'display': 'none'}, children=[
        html.H1('Comparación de Compras y Ventas por Mes', style={"textAlign": "center"}),

        # Dropdown para seleccionar el año
        dcc.Dropdown(
            id='year-dropdown',
            options=[
                {'label': '2015', 'value': 2015},
                {'label': '2016', 'value': 2016},
                {'label': '2017', 'value': 2017},
                {'label': '2018', 'value': 2018},
                {'label': '2019', 'value': 2019},
                {'label': '2020', 'value': 2020},
                {'label': '2021', 'value': 2021},
                {'label': '2022', 'value': 2022},
                {'label': '2023', 'value': 2023},
                {'label': '2024', 'value': 2024},
                {'label': '2025', 'value': 2025},
            ],
            value=2025,
            style={'width': '200px'}
        ),

        # Gráfico de línea para mostrar total gastado por mes en E_COMPRAS
        dcc.Graph(id='line-plot-compras'),

        # DataTable para mostrar datos por año y mes de E_COMPRAS
        html.H2('Tabla de Compras por Año y Mes', style={"textAlign": "center"}),
        dash_table.DataTable(
            id='data-table-compras',
            columns=[
                {'name': 'Año', 'id': 'ANIO'},
                {'name': 'Mes', 'id': 'MES'},
                {'name': 'Total Gastado', 'id': 'TOTAL_GASTADO'},
            ],
            style_table={'overflowX': 'scroll'},
            style_cell={
                'minWidth': '50px', 'width': '100px', 'maxWidth': '150px',
                'whiteSpace': 'normal',
                'textAlign': 'left'
            },
        ),

        # Gráfico de línea para mostrar total vendido por mes en E_VENTAS
        dcc.Graph(id='line-plot-ventas'),

        # DataTable para mostrar datos por año y mes de E_VENTAS
        html.H2('Tabla de Ventas por Año y Mes', style={"textAlign": "center"}),
        dash_table.DataTable(
            id='data-table-ventas',
            columns=[
                {'name': 'Año', 'id': 'ANIO'},
                {'name': 'Mes', 'id': 'MES'},
                {'name': 'Total Vendido', 'id': 'TOTAL_VENDIDO'},
            ],
            style_table={'overflowX': 'scroll'},
            style_cell={
                'minWidth': '50px', 'width': '100px', 'maxWidth': '150px',
                'whiteSpace': 'normal',
                'textAlign': 'left'
            },
        ),
    ])
])

# Callback para manejar el login
@app.callback(
    [Output('login-message', 'children'),
     Output('login-container', 'style'),
     Output('app-container', 'style')],
    [Input('login-button', 'n_clicks')],
    [dash.dependencies.State('password-input', 'value')]
)
def authenticate_user(n_clicks, password):
    if n_clicks > 0:
        if password == correct1:
            return '', {'display': 'none'}, {'display': 'block'}
        else:
            return 'Contraseña incorrecta. Inténtalo de nuevo.', {'display': 'block'}, {'display': 'none'}
    
    return '', {'display': 'block'}, {'display': 'none'}

# Callback para actualizar los gráficos y DataTables basado en la selección del año
@app.callback(
    [Output('line-plot-compras', 'figure'),
     Output('data-table-compras', 'data'),
     Output('line-plot-ventas', 'figure'),
     Output('data-table-ventas', 'data')],
    [Input('year-dropdown', 'value')]
)
def update_plots_and_tables(selected_year):
    # Consulta SQL para obtener el total gastado por mes y año en E_COMPRAS
    sql_query_compras = f"""
        SELECT EXTRACT(YEAR FROM FECHA) AS ANIO, EXTRACT(MONTH FROM FECHA) AS MES, SUM(TOTAL) AS TOTAL_GASTADO
        FROM E_COMPRAS
        WHERE EXTRACT(YEAR FROM FECHA) = {selected_year}
        GROUP BY ANIO, MES
        ORDER BY ANIO, MES
    """
    
    # Consulta SQL para obtener el total vendido por mes y año en E_VENTAS
    sql_query_ventas = f"""
        SELECT EXTRACT(YEAR FROM FECHA) AS ANIO, EXTRACT(MONTH FROM FECHA) AS MES, SUM(TOTAL) AS TOTAL_VENDIDO
        FROM E_VENTAS
        WHERE EXTRACT(YEAR FROM FECHA) = {selected_year}
        GROUP BY ANIO, MES
        ORDER BY ANIO, MES
    """
    
    # Ejecutar las consultas SQL y obtener los resultados para E_COMPRAS
    cursor_compras = con.cursor()
    cursor_compras.execute(sql_query_compras)
    result_compras = cursor_compras.fetchall()
    df_compras = pd.DataFrame(result_compras, columns=['ANIO', 'MES', 'TOTAL_GASTADO'])
    cursor_compras.close()
    
    # Ejecutar las consultas SQL y obtener los resultados para E_VENTAS
    cursor_ventas = con.cursor()
    cursor_ventas.execute(sql_query_ventas)
    result_ventas = cursor_ventas.fetchall()
    df_ventas = pd.DataFrame(result_ventas, columns=['ANIO', 'MES', 'TOTAL_VENDIDO'])
    cursor_ventas.close()
    
    # Crear el gráfico de línea para E_COMPRAS utilizando Plotly Express
    fig_compras = px.line(df_compras, x='MES', y='TOTAL_GASTADO',
                          title=f'Total Gastado por Mes en Compras para el año {selected_year}',
                          labels={'MES': 'Mes', 'TOTAL_GASTADO': 'Total Gastado'})
    
    # Preparar los datos para el DataTable de E_COMPRAS
    data_table_compras = df_compras.to_dict('records')
    
    # Crear el gráfico de línea para E_VENTAS utilizando Plotly Express
    fig_ventas = px.line(df_ventas, x='MES', y='TOTAL_VENDIDO',
                         title=f'Total Vendido por Mes en Ventas para el año {selected_year}',
                         labels={'MES': 'Mes', 'TOTAL_VENDIDO': 'Total Vendido'})
    
    # Preparar los datos para el DataTable de E_VENTAS
    data_table_ventas = df_ventas.to_dict('records')
    
    return fig_compras, data_table_compras, fig_ventas, data_table_ventas


if __name__ == "__main__":
    app.run(debug=True, use_reloader=False)  # Desactiva el recargador automático
