#!/bin/bash

# Script de instalación para proyecto Tomcat UNIEXT
# Uso: ./setup.sh

set -e

echo "═══════════════════════════════════════════════════════════════════════════════"
echo "  INSTALACIÓN DEL PROYECTO UNIEXT"
echo "═══════════════════════════════════════════════════════════════════════════════"

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Verificar Java
echo -e "${YELLOW}[1/5]${NC} Verificando Java..."
if ! command -v java &> /dev/null; then
    echo -e "${RED}✗ Java no está instalado${NC}"
    echo "Por favor, instala JDK 11 o superior"
    exit 1
fi
JAVA_VERSION=$(java -version 2>&1 | awk -F '"' '{print $2}')
echo -e "${GREEN}✓ Java $JAVA_VERSION encontrado${NC}"

# Verificar Maven
echo -e "${YELLOW}[2/5]${NC} Verificando Maven..."
if ! command -v mvn &> /dev/null; then
    echo -e "${RED}✗ Maven no está instalado${NC}"
    echo "Por favor, instala Maven 3.6 o superior"
    exit 1
fi
MVN_VERSION=$(mvn -v | head -n 1)
echo -e "${GREEN}✓ $MVN_VERSION encontrado${NC}"

# Crear estructura de carpetas
echo -e "${YELLOW}[3/5]${NC} Creando estructura de carpetas..."
mkdir -p src/main/java/com/uniext/{controller,service,dao,model,util}
mkdir -p src/main/resources
mkdir -p src/main/webapp/{WEB-INF,jsp,css,js}
mkdir -p src/test/java
mkdir -p src/test/resources
mkdir -p config/tomcat
mkdir -p config/database
mkdir -p docs
mkdir -p logs
echo -e "${GREEN}✓ Estructura de carpetas creada${NC}"

# Descargar dependencias
echo -e "${YELLOW}[4/5]${NC} Descargando dependencias Maven..."
mvn dependency:resolve
echo -e "${GREEN}✓ Dependencias descargadas${NC}"

# Compilar proyecto
echo -e "${YELLOW}[5/5]${NC} Compilando proyecto..."
mvn clean compile
echo -e "${GREEN}✓ Proyecto compilado${NC}"

echo ""
echo "═══════════════════════════════════════════════════════════════════════════════"
echo -e "${GREEN}✓ Instalación completada exitosamente${NC}"
echo "═══════════════════════════════════════════════════════════════════════════════"
echo ""
echo "Próximos pasos:"
echo "1. Configurar base de datos en config/database/init.sql"
echo "2. Configurar Tomcat en config/tomcat/context.xml"
echo "3. Compilar con: mvn clean package"
echo "4. Desplegar con: ./scripts/deploy.sh"
echo ""
