#!/bin/bash

# Script de despliegue para Tomcat UNIEXT
# Uso: ./deploy.sh

set -e

echo "═══════════════════════════════════════════════════════════════════════════════"
echo "  DESPLIEGUE DEL PROYECTO UNIEXT"
echo "═══════════════════════════════════════════════════════════════════════════════"

# Verificar que CATALINA_HOME esté configurado
if [ -z "$CATALINA_HOME" ]; then
    echo "Error: CATALINA_HOME no está configurado"
    echo "Por favor, configura la variable de entorno CATALINA_HOME"
    echo "Ejemplo: export CATALINA_HOME=/path/to/tomcat"
    exit 1
fi

echo "CATALINA_HOME: $CATALINA_HOME"

# Compilar proyecto
echo ""
echo "[1/3] Compilando proyecto..."
mvn clean package -DskipTests
echo "✓ Proyecto compilado"

# Detener Tomcat si está ejecutándose
echo ""
echo "[2/3] Deteniendo Tomcat..."
if [ -f "$CATALINA_HOME/bin/shutdown.sh" ]; then
    $CATALINA_HOME/bin/shutdown.sh
    sleep 3
    echo "✓ Tomcat detenido"
fi

# Eliminar aplicación anterior
echo ""
echo "[3/3] Desplegando nueva versión..."
rm -rf "$CATALINA_HOME/webapps/uniext"
rm -f "$CATALINA_HOME/webapps/uniext.war"
cp target/uniext.war "$CATALINA_HOME/webapps/"
echo "✓ Aplicación desplegada"

# Iniciar Tomcat
echo ""
echo "Iniciando Tomcat..."
$CATALINA_HOME/bin/startup.sh

echo ""
echo "═══════════════════════════════════════════════════════════════════════════════"
echo "✓ Despliegue completado"
echo "═══════════════════════════════════════════════════════════════════════════════"
echo ""
echo "La aplicación estará disponible en:"
echo "  http://localhost:8080/uniext"
echo ""
echo "Ver logs con:"
echo "  tail -f $CATALINA_HOME/logs/catalina.out"
echo ""
