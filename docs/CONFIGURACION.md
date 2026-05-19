# Guía de Configuración - UNIEXT

## Índice
1. [Base de Datos](#base-de-datos)
2. [Tomcat](#tomcat)
3. [Aplicación](#aplicación)
4. [Seguridad](#seguridad)
5. [Rendimiento](#rendimiento)

## Base de Datos

### MySQL

**Archivo**: `config/database/init.sql`

#### Conexión
```properties
db.driver=com.mysql.cj.jdbc.Driver
db.url=jdbc:mysql://localhost:3306/uniext?useSSL=false&serverTimezone=UTC
db.username=root
db.password=tu_contraseña
db.pool.size=10
```

#### Opciones avanzadas
```properties
# Codificación
db.url=jdbc:mysql://localhost:3306/uniext?useUnicode=true&characterEncoding=utf8mb4

# SSL (recomendado para producción)
db.url=jdbc:mysql://localhost:3306/uniext?useSSL=true&requireSSL=true

# Timezone
db.url=jdbc:mysql://localhost:3306/uniext?serverTimezone=America/Mexico_City
```

### PostgreSQL

**Archivo**: `config/database/init.sql`

#### Conexión
```properties
db.driver=org.postgresql.Driver
db.url=jdbc:postgresql://localhost:5432/uniext
db.username=postgres
db.password=tu_contraseña
db.pool.size=10
```

#### Opciones avanzadas
```properties
# SSL
db.url=jdbc:postgresql://localhost:5432/uniext?sslmode=require

# Timezone
db.url=jdbc:postgresql://localhost:5432/uniext?TimeZone=America/Mexico_City
```

## Tomcat

### Configuración del servidor

**Archivo**: `config/tomcat/server.xml`

#### Puerto
```xml
<Connector port="8080" protocol="HTTP/1.1" />
```

#### Múltiples conectores
```xml
<!-- HTTP -->
<Connector port="8080" protocol="HTTP/1.1" />

<!-- HTTPS -->
<Connector port="8443" protocol="HTTP/1.1" SSLEnabled="true" />

<!-- AJP (para Apache) -->
<Connector port="8009" protocol="AJP/1.3" />
```

### Contexto de la aplicación

**Archivo**: `config/tomcat/context.xml`

#### Datasource
```xml
<Resource
    name="jdbc/uniextDB"
    auth="Container"
    type="javax.sql.DataSource"
    driverClassName="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/uniext"
    username="root"
    password="password"
    maxActive="20"
    maxIdle="10"
    maxWait="-1"
/>
```

#### Uso en aplicación
```java
Context initCtx = new InitialContext();
DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/uniextDB");
Connection conn = ds.getConnection();
```

## Aplicación

### Propiedades de la aplicación

**Archivo**: `src/main/resources/application.properties`

#### Logging
```properties
log.level=INFO
log.path=./logs
log.max.file.size=10MB
log.max.backup.index=10
```

#### Sesión
```properties
session.timeout=1800
session.cookie.secure=false
session.cookie.httponly=true
```

#### Caracteres especiales
```properties
file.encoding=UTF-8
```

### Logging

**Archivo**: `src/main/resources/log4j.properties`

#### Niveles de log
```properties
log4j.rootLogger=INFO, FILE, CONSOLE
log4j.logger.com.uniext=DEBUG
```

#### Niveles disponibles
- `TRACE` - Información muy detallada
- `DEBUG` - Información de depuración
- `INFO` - Información general
- `WARN` - Advertencias
- `ERROR` - Errores
- `FATAL` - Errores fatales

## Seguridad

### HTTPS/SSL

#### Generar certificado
```bash
keytool -genkey -alias tomcat -keyalg RSA -keystore keystore.jks -validity 365
```

#### Configurar en server.xml
```xml
<Connector
    port="8443"
    protocol="HTTP/1.1"
    SSLEnabled="true"
    scheme="https"
    secure="true"
    keystoreFile="path/to/keystore.jks"
    keystorePass="password"
    clientAuth="false"
    sslProtocol="TLS"
/>
```

### Headers de seguridad

**Archivo**: `src/main/webapp/WEB-INF/web.xml`

```xml
<filter>
    <filter-name>SecurityHeadersFilter</filter-name>
    <filter-class>com.uniext.filter.SecurityHeadersFilter</filter-class>
</filter>

<filter-mapping>
    <filter-name>SecurityHeadersFilter</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>
```

### Control de sesión

```xml
<session-config>
    <cookie-config>
        <secure>true</secure>
        <http-only>true</http-only>
    </cookie-config>
    <timeout>30</timeout>
</session-config>
```

## Rendimiento

### Memoria Java

#### Linux/Mac
```bash
# Editar $CATALINA_HOME/bin/catalina.sh
export JAVA_OPTS="-Xms1024m -Xmx2048m -XX:+UseG1GC"
```

#### Windows
```batch
# Editar %CATALINA_HOME%\bin\setenv.bat
set JAVA_OPTS=-Xms1024m -Xmx2048m -XX:+UseG1GC
```

### Parámetros recomendados

| Entorno | Xms | Xmx | GC |
|---------|-----|-----|----|
| Desarrollo | 512m | 1024m | G1GC |
| Pruebas | 1024m | 2048m | G1GC |
| Producción | 2048m | 4096m | G1GC |

### Pool de conexiones

```properties
# application.properties
db.pool.size=20
db.pool.max.idle.time=300
db.connection.timeout=30000
```

### Compresión

```xml
<!-- server.xml -->
<Connector
    port="8080"
    protocol="HTTP/1.1"
    compression="on"
    compressionMinSize="2048"
/>
```

### Caché

```xml
<!-- context.xml -->
<Resources cachingAllowed="true" cacheMaxSize="100000" />
```

## Variables de Entorno

### Linux/Mac
```bash
export CATALINA_HOME=/path/to/tomcat
export CATALINA_OPTS="-Xms1024m -Xmx2048m"
export JAVA_OPTS="-Dfile.encoding=UTF-8"
```

### Windows
```batch
set CATALINA_HOME=C:\Program Files\Tomcat
set CATALINA_OPTS=-Xms1024m -Xmx2048m
set JAVA_OPTS=-Dfile.encoding=UTF-8
```

## Checklista de Configuración

- [ ] Base de datos configurada y accesible
- [ ] Variables de entorno (JAVA_HOME, CATALINA_HOME) establecidas
- [ ] Propiedades de aplicación configuradas
- [ ] Logging configurado correctamente
- [ ] Memoria Java asignada adecuadamente
- [ ] Pool de conexiones dimensionado
- [ ] HTTPS/SSL configurado (si es necesario)
- [ ] Backups de base de datos configurados
- [ ] Monitoreo implementado

## Recursos

- [Documentación Tomcat](https://tomcat.apache.org/)
- [Log4j Properties](https://logging.apache.org/log4j/1.2/)
- [Java JDBC](https://docs.oracle.com/javase/tutorial/jdbc/)
