from flask import Flask, request, jsonify
from flask_cors import CORS
import os
import json

app = Flask(__name__)
CORS(app)  # Permitir solicitudes de diferentes dominios durante el desarrollo

# Configuración de la carpeta donde se guardarán las imágenes (Ruta absoluta, como has indicado)
UPLOAD_FOLDER = 'C:\\sistemaMati\\ExitosReactWeb\\backend\\static\\images'
PRODUCTS_FILE = 'C:\\sistemaMati\\ExitosReactWeb\\frontend\\public\\products.json'  # Archivo donde se almacenarán los productos
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# Asegúrate de que la carpeta de destino exista
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

# Función para cargar los productos desde el archivo JSON
def load_products():
    if os.path.exists(PRODUCTS_FILE):
        with open(PRODUCTS_FILE, 'r') as f:
            products = json.load(f)
            print(f"Productos cargados: {products}")  # Imprimir productos cargados para depuración
            return products
    else:
        print(f"El archivo {PRODUCTS_FILE} no existe. Se creará uno nuevo.")  # Mensaje de depuración
        return []

# Función para guardar los productos en el archivo JSON
def save_products(products):
    print(f"Guardando productos: {products}")  # Imprimir los productos antes de guardarlos
    with open(PRODUCTS_FILE, 'w') as f:
        json.dump(products, f, indent=2)
    print("Productos guardados exitosamente.")  # Confirmar que se guardaron

@app.route('/upload', methods=['POST'])
def upload_file():
    # Verifica si el archivo y los datos adicionales están presentes en la solicitud
    if 'image' not in request.files or not request.form.get('alt') or not request.form.get('price'):
        return jsonify({"error": "Imagen, nombre y precio son requeridos"}), 400

    image = request.files['image']
    alt = request.form.get('alt')  # Nombre del producto
    price = request.form.get('price')  # Precio del producto
    desc = request.form.get('desc', '')  # Descripción (opcional)

    if image.filename == '':
        return jsonify({"error": "No selected file"}), 400

    if image:
        # Generar una ruta única para la imagen (asegurándote de que no haya conflictos de directorio)
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], image.filename)
        
        # Verificar que la carpeta donde se va a guardar la imagen exista
        os.makedirs(os.path.dirname(file_path), exist_ok=True)  # Crea el directorio si no existe

        image.save(file_path)

        # Cargar los productos actuales desde el archivo JSON
        products = load_products()

        # Crear el nuevo producto
        new_product = {
            "id": len(products) + 1,  # ID incremental
            "src": f"/static/images/{image.filename}",  # Ruta relativa que el frontend puede usar
            "alt": alt,
            "quant": 0,  # Inicialmente, cantidad en 0
            "desc": desc,
            "price": price
        }

        # Añadir el nuevo producto a la lista
        products.append(new_product)

        # Guardar los productos actualizados en el archivo JSON
        save_products(products)

        return jsonify({"message": "Producto subido exitosamente", "product": new_product}), 200

    return jsonify({"error": "File not uploaded"}), 400

@app.route('/products', methods=['GET'])
def get_products():
    products = load_products()
    return jsonify(products)

if __name__ == '__main__':
    app.run(debug=True)
