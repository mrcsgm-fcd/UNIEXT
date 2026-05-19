# Guía de Instalación - UNIEXT

## Requisitos del Sistema

### Software
- **Java Development Kit (JDK)**: 11 o superior
  - Descargar desde: https://www.oracle.com/java/technologies/downloads/
  - Verificar instalación: `java -version`

- **Apache Maven**: 3.6 o superior
  - Descargar desde: https://maven.apache.org/download.cgi
  - Verificar instalación: `mvn -version`

- **Apache Tomcat**: 9.x o superior
  - Descargar desde: https://tomcat.apache.org/
  - Descomprimir en una ubicación de tu preferencia

- **Base de Datos** (una de las siguientes):
  - MySQL 5.7 o superior
  - PostgreSQL 10 o superior

### Hardware Recomendado
- RAM: Mínimo 2GB (4GB recomendado)
- Espacio en disco: 500MB
- CPU: Dual-core (4-core recomendado)

## Instalación en Linux/Mac

### 1. Clonar o descargar el proyecto
```bash
cd /ruta/deseada
git clone https://github.com/mrcsgm-fcd/UNIEXT.git
cd UNIEXT
```

### 2. Ejecutar el script de instalación
```bash
chmod +x scripts/setup.sh
./scripts/setup.sh
```

### 3. Configurar las variables de entorno
```bash
# Agregar a ~/.bashrc o ~/.zshrc
export JAVA_HOME=/path/to/jdk
export MAVEN_HOME=/path/to/maven
export CATALINA_HOME=/path/to/tomcat

export PATH=$JAVA_HOME/bin:$MAVEN_HOME/bin:$CATALINA_HOME/bin:$PATH

# Aplicar cambios
source ~/.bashrc
```

## Instalación en Windows

### 1. Clonar o descargar el proyecto
```cmd
cd ruta\deseada
git clone https://github.com/mrcsgm-fcd/UNIEXT.git
cd UNIEXT
```

### 2. Ejecutar el script de instalación
```cmd
scripts\setup.bat
```

### 3. Configurar las variables de entorno
- Abre Panel de Control → Propiedades del Sistema → Variables de entorno

Agrega las siguientes variables:
- `JAVA_HOME` = `C:\Program Files\Java\jdk-11.x.x`
- `MAVEN_HOME` = `C:\Program Files\Maven\apache-maven-3.x.x`
- `CATALINA_HOME` = `C:\Program Files\Tomcat\apache-tomcat-9.x.x`

Añade a `PATH`:
- `%JAVA_HOME%\bin`
- `%MAVEN_HOME%\bin`
- `%CATALINA_HOME%\bin`

## Configuración Inicial

### 1. Base de Datos

#### MySQL
```bash
# Crear base de datos
mysql -u root -p < config/database/init.sql

# Actualizar credenciales en src/main/resources/application.properties
db.username=root
db.password=tu_password
db.url=jdbc:mysql://localhost:3306/uniext
```

#### PostgreSQL
```bash
# Crear base de datos
psql -U postgres < config/database/init.sql

# Actualizar credenciales en src/main/resources/application.properties
db.driver=org.postgresql.Driver
db.url=jdbc:postgresql://localhost:5432/uniext
db.username=postgres
db.password=tu_password
```

### 2. Compilación
```bash
mvn clean install
```

### 3. Despliegue
```bash
# Automático (recomendado)
./scripts/deploy.sh

# Manual
mvn clean package
cp target/uniext.war $CATALINA_HOME/webapps/
$CATALINA_HOME/bin/startup.sh
```

## Verificación de Instalación

### Acceder a la aplicación
- Abrir navegador: http://localhost:8080/uniext
- Debería verse la página de inicio

### Credenciales por defecto
- **Usuario**: admin@uniext.com
- **Contraseña**: admin123

### Ver logs
```bash
# Linux/Mac
tail -f $CATALINA_HOME/logs/catalina.out

# Windows
type "%CATALINA_HOME%\logs\catalina.out"
```

## Solución de Problemas

### Puerto 8080 en uso
```bash
# Linux/Mac - encontrar proceso
lsof -i :8080

# Windows
netstat -ano | findstr :8080

# Cambiar puerto en config/tomcat/server.xml
<Connector port="8081" ... />
```

### Error de permisos en Linux
```bash
chmod +x scripts/*.sh
chmod 755 $CATALINA_HOME/bin/*.sh
```

### Memoria insuficiente
```bash
# Editar CATALINA_HOME/bin/catalina.sh (Linux) o setenv.bat (Windows)
export JAVA_OPTS="-Xms1024m -Xmx2048m"
```

## Próximos Pasos

1. Ver `docs/CONFIGURACION.md` para configuración avanzada
2. Crear controladores en `src/main/java/com/uniext/controller/`
3. Crear servicios en `src/main/java/com/uniext/service/`
4. Crear JSP en `src/main/webapp/jsp/`

## Soporte

Para más información, consulta la documentación de:
- [Apache Tomcat](https://tomcat.apache.org/)
- [Apache Maven](https://maven.apache.org/)
- [Java Documentation](https://docs.oracle.com/en/java/)
