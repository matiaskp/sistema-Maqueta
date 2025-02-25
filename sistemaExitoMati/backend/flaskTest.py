from flask import Flask, request, jsonify, send_from_directory
from flask_sqlalchemy import SQLAlchemy 
from flask_cors import CORS  # type: ignore
import os
import json

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///todos.db"
app.config["SECRET_KEY"] = "some environment variable"
db = SQLAlchemy(app)
CORS(app)

UPLOAD_FOLDER = 'C:/sistema-Maqueta/ExitosReactWeb/frontend/public/products'  # La ruta de la carpeta donde se guardarán las imágenes
PRODUCTS_FILE = 'C:/sistema-Maqueta/ExitosReactWeb/frontend/public/products.json'  # Ruta del archivo JSON de productos
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# Asegúrate de que la carpeta de destino exista
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

class Todos(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    todo = db.Column(db.String(1024), nullable=False)

    def todo_to_dict(self):
        return {
            "id": self.id,
            "todo": self.todo
        }

class Transactions(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    text = db.Column(db.String(220), nullable=False)
    amount = db.Column(db.Integer, nullable=False)

    def transaction_to_dict(self):
        return {
            "id": self.id,
            "text": self.text,
            "amount": self.amount
        }

@app.route("/todos", methods=["GET", "POST"])
def todos():
    if request.method == "GET":
        myTodos = Todos.query.all()
        todosDict = [todo.todo_to_dict() for todo in myTodos]
        return jsonify(todosDict)
    if request.method == "POST":
        try:
            newTodo = Todos(todo=request.json["todo"])
            db.session.add(newTodo)
            db.session.commit()
            return jsonify(newTodo.todo_to_dict()), 201
        except Exception as e:
            return jsonify({"error": e}), 400

@app.route("/delete/<int:id>", methods=["DELETE"])
def delete(id):
    try:
        todoDelete = Todos.query.get_or_404(id)
        db.session.delete(todoDelete)
        db.session.commit()
        return jsonify({"message": "deleted successfully!"}), 201
    except Exception as e:
        return jsonify({"error": e}), 400

@app.route("/update/<int:id>", methods=["PUT"])
def update(id):
    try:
        todo = Todos.query.get_or_404(id)
        todo.todo = request.json["todo"]
        db.session.commit()
        return jsonify({"message": "successfully updated!"})
    except Exception as e:
        return jsonify({"error": e}), 400

@app.route("/transaction", methods=["POST", "GET"])
def transaction():
    if request.method == "GET":
        try:
            transaction = Transactions.query.all()
            allTransaction = [tran.transaction_to_dict() for tran in transaction]
            return jsonify(allTransaction), 201
        except Exception as e:
            return jsonify({"error": e}), 400
    elif request.method == "POST":
        try:
            newTransaction = Transactions(text=request.json["text"], amount=request.json["amount"])
            db.session.add(newTransaction)
            db.session.commit()
            return jsonify(newTransaction.transaction_to_dict())
        except Exception as e:
            return jsonify({"error": e})

@app.route("/deleteTransaction/<int:id>", methods=["DELETE"])
def deleteTransaction(id):
    try:
        transactionToDelete = Transactions.query.get_or_404(id)
        db.session.delete(transactionToDelete)
        db.session.commit()
        return jsonify({"message": "successfully deleted!"})
    except Exception as e:
        return jsonify({"error": e})

# Función para cargar los productos desde el archivo JSON
def load_products():
    if os.path.exists(PRODUCTS_FILE):
        with open(PRODUCTS_FILE, 'r') as f:
            return json.load(f)
    return []

# Función para guardar los productos en el archivo JSON
def save_products(products):
    with open(PRODUCTS_FILE, 'w') as f:
        json.dump(products, f, indent=2)

# Ruta para servir las imágenes desde 'public/products'
@app.route('/products/<filename>')
def uploaded_file(filename):
    return send_from_directory(UPLOAD_FOLDER, filename)

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
        # Generar la ruta de la imagen en 'frontend/public/products'
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], image.filename)

        # Verificar que la carpeta donde se va a guardar la imagen exista
        os.makedirs(os.path.dirname(file_path), exist_ok=True)  # Crea el directorio si no existe

        image.save(file_path)

        # Cargar los productos actuales desde el archivo JSON
        products = load_products()

        # Crear el nuevo producto
        new_product = {
            "id": len(products) + 1,  # ID incremental
            "src": f"{image.filename}",  # Ruta relativa que el frontend puede usar
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

if __name__ == "__main__":
    app.run(debug=True,port=5000)
