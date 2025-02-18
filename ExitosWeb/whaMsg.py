import urllib.parse
mensaje = "Nombre y Apellido:Matias Orue\nPedido:3 pompeyas carne\nUbicacion:Lambare"
mensaje_codificado = urllib.parse.quote(mensaje)
print(mensaje_codificado)
telefono = "595983240499"
url_whatsapp = f"https://api.whatsapp.com/send?phone={telefono}&text={mensaje_codificado}"
print(url_whatsapp)
