import sqlite3
from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "http://localhost:5173"}})

# Ruta para obtener datos de form.db
@app.route("/customerOrders", methods=["GET"])
def get_customerOrders():
    conn = sqlite3.connect(r'C:\sistema-Maqueta/ExitosReactWeb\backend\instance\form.db')
    cursor = conn.cursor()
    conn2 = sqlite3.connect(r"C:\sistema-Maqueta\ExitosReactWeb\backend\instance\form.db")
    cursor2 = conn2.cursor()
    try:
        # Realizamos una consulta sobre la base de datos form.db
        cursor.execute("SELECT * FROM form")
        rows = cursor.fetchall()
        cursor2.execute("SELECT * from cart_item")
        rows2 = cursor2.fetchall()
        # Convertimos los resultados a un formato adecuado para JSON
        customerOrders = [{"name": row[1], "lastName": row[2],"mail":row[3],"phone":row[4]} for row in rows]
        customerOrders2 = [{"id": row[0], "producto": row[4],"cantidad":row[3],"precio":row[5]} for row in rows2]
        
        return jsonify(customerOrders,customerOrders2)
    except Exception as e:
        return jsonify({"error": str(e)}), 400
    finally:
        conn.close()  # Cerramos la conexión
        conn2.close()

if __name__ == "__main__":
    app.run(debug=True)
