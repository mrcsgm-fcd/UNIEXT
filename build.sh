#!/bin/bash

# Script para compilar y generar WAR

echo "═══════════════════════════════════════════════════════════════════════════════════"
echo "  COMPILACIÓN Y CONSTRUCCIÓN DEL PROYECTO UNIEXT"
echo "═══════════════════════════════════════════════════════════════════════════════════"
echo ""

# Compilar
echo "[1/2] Compilando con Maven..."
mvn clean package
if [ $? -ne 0 ]; then
    echo "Error durante la compilación"
    exit 1
fi

echo ""
echo "[2/2] Construyendo archivo WAR..."
echo ""

if [ -f "target/uniext.war" ]; then
    echo "✓ Archivo WAR creado exitosamente"
    echo "Ruta: $(pwd)/target/uniext.war"
    echo "Tamaño: $(du -h target/uniext.war | cut -f1)"
else
    echo "✗ Error - No se generó el archivo WAR"
    exit 1
fi

echo ""
echo "═══════════════════════════════════════════════════════════════════════════════════"
echo "Próximos pasos:"
echo "1. Desplegar en Tomcat: ./scripts/deploy.sh"
echo "2. O copiar el WAR a: \$CATALINA_HOME/webapps/"
echo "═══════════════════════════════════════════════════════════════════════════════════"
echo ""
