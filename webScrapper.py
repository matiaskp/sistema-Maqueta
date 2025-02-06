import requests
from bs4 import BeautifulSoup
import pandas as pd

# URL de la página de productos
url = "https://nissei.com/py/informatica/notebooks/notebooks-para-oficina-estudio/notebooks-para-trabajar"

# Realizar la solicitud HTTP para obtener el contenido de la página
response = requests.get(url)

# Analizar el contenido HTML con BeautifulSoup
soup = BeautifulSoup(response.text, 'html.parser')

# Encontrar todos los productos en la lista ol.product-items
productos = soup.find_all('li', class_='product-item')

# Crear una lista vacía para almacenar los datos
datos = []

# Recorrer cada producto encontrado en la página
for producto in productos:
    # Extraer el nombre del producto (h2 con clase 'product-item-name')
    nombre = producto.find('h2', class_='product-item-name').text.strip() if producto.find('h2', class_='product-item-name') else 'No disponible'
    
    # Extraer el precio del producto (div con clase 'price-final_price')
    precio = producto.find('div', class_='price-final_price').text.strip() if producto.find('div', class_='price-final_price') else 'No disponible'
    
    # Almacenar el nombre y el precio en la lista
    datos.append([nombre, precio])

# Convertir los datos a un DataFrame de pandas para tenerlos en formato tabular
df = pd.DataFrame(datos, columns=['Producto', 'Precio'])

# Guardar los datos en un archivo CSV
df.to_csv('productos2_nissei.csv', index=False)

# Mostrar los primeros datos obtenidos para asegurarnos que todo funcione bien
print(df.head())
print(df.info())
df['Precio'] = df['Precio'].str.replace(r'Gs.\s*', '', regex=True)

