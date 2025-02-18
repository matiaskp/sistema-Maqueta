@echo off
rem Cambia al directorio donde está el script Python (C:\sistemaMati\ExitosWeb)
cd C:\sistemaMati\ExitosWeb

rem Ejecuta el script de Python en segundo plano
echo Ejecutando script de Python...
start python reportes.py C:\sistemaMati\sistemaExitoMati

rem Cambia al directorio donde está la aplicación de React (C:\sistemaMati\sistemaExitoMati)
cd C:\sistemaMati\sistemaExitoMati

rem Ejecuta el servidor de desarrollo de React (npm run dev)
echo Iniciando servidor de React...
npm run dev

rem Pausa para ver los mensajes
pause
