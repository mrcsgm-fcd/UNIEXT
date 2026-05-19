@echo off
REM Script de instalación para proyecto Tomcat UNIEXT (Windows)
REM Uso: setup.bat

setlocal enabledelayedexpansion

echo ===============================================================================
echo   INSTALACION DEL PROYECTO UNIEXT
echo ===============================================================================
echo.

REM Verificar Java
echo [1/5] Verificando Java...
where java >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo X Java no esta instalado
    echo Por favor, instala JDK 11 o superior
    exit /b 1
)
for /f "tokens=3" %%g in ('java -version 2^>^&1 ^| findstr /R "version"') do (
    echo OK Java %%g encontrado
)

REM Verificar Maven
echo [2/5] Verificando Maven...
where mvn >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo X Maven no esta instalado
    echo Por favor, instala Maven 3.6 o superior
    exit /b 1
)
echo OK Maven encontrado

REM Crear estructura de carpetas
echo [3/5] Creando estructura de carpetas...
if not exist "src\main\java\com\uniext\controller" mkdir src\main\java\com\uniext\controller
if not exist "src\main\java\com\uniext\service" mkdir src\main\java\com\uniext\service
if not exist "src\main\java\com\uniext\dao" mkdir src\main\java\com\uniext\dao
if not exist "src\main\java\com\uniext\model" mkdir src\main\java\com\uniext\model
if not exist "src\main\java\com\uniext\util" mkdir src\main\java\com\uniext\util
if not exist "src\main\resources" mkdir src\main\resources
if not exist "src\main\webapp\WEB-INF" mkdir src\main\webapp\WEB-INF
if not exist "src\main\webapp\jsp" mkdir src\main\webapp\jsp
if not exist "src\main\webapp\css" mkdir src\main\webapp\css
if not exist "src\main\webapp\js" mkdir src\main\webapp\js
if not exist "src\test\java" mkdir src\test\java
if not exist "src\test\resources" mkdir src\test\resources
if not exist "config\tomcat" mkdir config\tomcat
if not exist "config\database" mkdir config\database
if not exist "docs" mkdir docs
if not exist "logs" mkdir logs
echo OK Estructura de carpetas creada

REM Descargar dependencias
echo [4/5] Descargando dependencias Maven...
call mvn dependency:resolve
if %ERRORLEVEL% NEQ 0 (
    echo X Error descargando dependencias
    exit /b 1
)
echo OK Dependencias descargadas

REM Compilar proyecto
echo [5/5] Compilando proyecto...
call mvn clean compile
if %ERRORLEVEL% NEQ 0 (
    echo X Error compilando proyecto
    exit /b 1
)
echo OK Proyecto compilado

echo.
echo ===============================================================================
echo OK Instalacion completada exitosamente
echo ===============================================================================
echo.
echo Proximos pasos:
echo 1. Configurar base de datos en config\database\init.sql
echo 2. Configurar Tomcat en config\tomcat\context.xml
echo 3. Compilar con: mvn clean package
echo 4. Desplegar con: .\scripts\deploy.sh
echo.
pause
