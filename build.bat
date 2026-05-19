@echo off
REM Script para compilar y generar WAR
echo ===============================================================================
echo   COMPILACION Y CONSTRUCCION DEL PROYECTO UNIEXT
echo ===============================================================================
echo.

REM Compilar
echo [1/2] Compilando con Maven...
call mvn clean package
if %ERRORLEVEL% NEQ 0 (
    echo Error durante la compilacion
    exit /b 1
)

echo.
echo [2/2] Construyendo archivo WAR...
echo.

if exist "target\uniext.war" (
    echo OK - Archivo WAR creado exitosamente
    echo Ruta: %CD%\target\uniext.war
    echo Tamano: 
    for %%A in ("target\uniext.war") do echo %%~zA bytes
) else (
    echo Error - No se genero el archivo WAR
    exit /b 1
)

echo.
echo ===============================================================================
echo Proximos pasos:
echo 1. Desplegar en Tomcat: .\scripts\deploy.sh
echo 2. O copiar el WAR a: %%CATALINA_HOME%%\webapps\
echo ===============================================================================
echo.
pause
