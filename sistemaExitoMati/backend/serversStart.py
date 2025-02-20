import subprocess
import signal
import os
import time

# Lanzar el servidor de React
react_process = subprocess.Popen([r'C:\Program Files\nodejs\npm.cmd', 'run', 'dev'], cwd=r'C:\sistema-Maqueta\sistemaExitoMati\frontend')


# Lanzar el servidor de Flask
flask_process = subprocess.Popen(['python', 'flaskTest.py'], cwd=r'C:\sistema-Maqueta\sistemaExitoMati\backend')
# Lanzar conexion a customerOrders db de ExitosReactWeb/backend
flask_process2 = subprocess.Popen(['python', 'customerOrders.py'], cwd=r'C:\sistema-Maqueta\sistemaExitoMati\backend')

# Lanzar el servidor de Dash (si es separado de Flask)
dash_process = subprocess.Popen(['python', 'reportes.py'], cwd='C:\\sistema-Maqueta\\ExitosWeb')

# Esperar a que el servidor React esté listo para abrir el navegador
time.sleep(3)  # Espera un poco para que el servidor React inicie

# Abrir el navegador automáticamente en la URL de React
subprocess.Popen(['start', 'http://localhost:5173'], shell=True)

# Mantener el script en ejecución hasta que el navegador se cierre
try:
    while True:
        time.sleep(1)
except KeyboardInterrupt:
    pass
finally:
    # Al cerrar el navegador, detener los procesos
    react_process.terminate()
    flask_process.terminate()
    flask_process2.terminate()
    dash_process.terminate()