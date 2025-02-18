from flask import Flask,render_template,url_for,flash,get_flashed_messages
from flask_sqlalchemy import SQLAlchemy
from flask_wtf import FlaskForm
from wtforms import StringField,SubmitField,TextAreaField
from wtforms.validators import DataRequired,Length
from flask_mail import Mail,Message

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///users.db"
app.config["SECRET_KEY"] = "some enviroment variable saved passwd" #Enviroment var
db = SQLAlchemy(app)
# Configuración del servidor SMTP de Outlook
"""
app.config['MAIL_SERVER'] = 'smtp-mail.outlook.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USE_SSL'] = False
app.config['MAIL_USERNAME'] = 'exitorepuestos2021@gmail.com'  # Tu dirección de correo de Outlook
app.config['MAIL_PASSWORD'] = ''  # Tu contraseña de Outlook

mail = Mail(app)
"""

class User(db.Model):
	id = db.Column(db.Integer,primary_key=True)
	name = db.Column(db.String(150),nullable=False)
	phone = db.Column(db.String(150),nullable=False)
	message = db.Column(db.String(1024),nullable=False)
class Register(FlaskForm):
	name = StringField(label="Nombre:",validators=[DataRequired(),Length(min=2,max=150)])
	phone = StringField(label="Número de teléfono:",validators=[DataRequired(),Length(min=2,max=150)])
	message = TextAreaField(label="Mensaje:",validators=[DataRequired(),Length(min=2,max=1024)])
	Enviar = SubmitField()

@app.route("/",methods=["GET","POST"])
def index():
	form = Register()
	if form.validate_on_submit():
		user_to_create = User(name=form.name.data,phone=form.phone.data,message=form.message.data)
		db.session.add(user_to_create)
		db.session.commit()
		#Enviar Mail
		"""
		msg = Message(
        	subject='Cliente Nuevo!',
        	sender='exitorepuestos2021@gmail.com',
        	recipients=['matiasoruerecoder9@gmail.com']
    	)
		msg.body = f"Nombre: {form.name.data}, Número de telefono: {form.phone.data}, Mensaje:{form.message.data}"
		mail.send(msg)
		"""
		form.name.data = ""
		form.phone.data = ""
		form.message.data = ""
		
		if form.errors != {}:
			for error in form.errors.values():
				flash(f"Error: {error}")
		else:
			flash("enviado correctamente! Un asesor lo contactará en la brevedad.")
	return render_template("index.html",form=form)

@app.route("/tiendaEnLínea")
def tiendaEnLinea():
	return render_template("tiendaEnLinea.html")

if __name__ == "__main__":
	app.run(debug=True)
