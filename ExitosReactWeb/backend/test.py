from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///form.db"
app.config["SECRET_KEY"] = "some environment variable"
db = SQLAlchemy(app)
CORS(app, resources={r"/*": {"origins": "http://localhost:5173"}})

class Form(db.Model):
    id = db.Column(db.Integer, primary_key=True, nullable=False)
    name = db.Column(db.String(150), nullable=False)
    lastName = db.Column(db.String(220), nullable=False)
    mail = db.Column(db.String(220), nullable=True)
    phone = db.Column(db.String(220), nullable=False)

class CartItem(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    form_id = db.Column(db.Integer, db.ForeignKey('form.id'), nullable=False)  # Relación con Form
    product_id = db.Column(db.Integer, nullable=False)
    quantity = db.Column(db.Integer, nullable=False)
    price = db.Column(db.String(1024), nullable=False)

@app.route("/form", methods=["POST"])
def home():
    if request.method == "POST":
        try:
            data = request.json
            # Crear un nuevo usuario
            new_user = Form(
                name=data["name"],
                lastName=data["lastName"],
                mail=data.get("mail"),
                phone=data["phone"],
            )
            db.session.add(new_user)
            db.session.flush()  # Asegúrate de obtener el ID del nuevo formulario antes de commit

            # Guardar los elementos del carrito relacionados con el formulario
            for item in data["cart"]:
                cart_item = CartItem(
                    form_id=new_user.id,  # Usamos new_user.id después de db.session.flush()
                    product_id=item["id"],
                    quantity=item["quant"],
                    price=item["price"],
                )
                db.session.add(cart_item)  # Agregar cada ítem de carrito a la sesión

            db.session.commit()  # Confirma todos los cambios

            return jsonify({"message": "Formulario enviado con éxito"}), 200
        except Exception as e:
            db.session.rollback()  # Rollback en caso de error
            return jsonify({"error": str(e)}), 400

if __name__ == "__main__":
    app.app_context().push()
    db.create_all()  # Asegúrate de crear las tablas antes de iniciar
    app.run(debug=True)
