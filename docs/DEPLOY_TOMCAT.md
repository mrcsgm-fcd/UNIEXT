# Guía de Despliegue en Tomcat - UNIEXT

## Requisitos previos

1. **Tomcat instalado** (versión 9.x o superior)
2. **Maven instalado** (para compilar)
3. **Java JDK 11** o superior
4. **Variables de entorno configuradas**:
   - `JAVA_HOME` - Ruta a JDK
   - `CATALINA_HOME` - Ruta a Tomcat
   - `MAVEN_HOME` - Ruta a Maven (opcional)

## Paso 1: Descargar y compilar

```bash
# Clonar el repositorio
git clone https://github.com/mrcsgm-fcd/UNIEXT.git
cd UNIEXT

# Compilar el proyecto
mvn clean package
```

Esto generará el archivo `target/uniext.war`

## Paso 2: Desplegar en Tomcat

### Opción A: Usando el script de despliegue (Recomendado)

#### Linux/Mac:
```bash
chmod +x scripts/deploy.sh
./scripts/deploy.sh
```

#### Windows:
```cmd
scripts\deploy.bat
```

### Opción B: Despliegue manual

#### Linux/Mac:
```bash
$CATALINA_HOME/bin/shutdown.sh
cp target/uniext.war $CATALINA_HOME/webapps/
$CATALINA_HOME/bin/startup.sh
tail -f $CATALINA_HOME/logs/catalina.out
```

#### Windows:
```cmd
%CATALINA_HOME%\bin\shutdown.bat
copy target\uniext.war %CATALINA_HOME%\webapps\
%CATALINA_HOME%\bin\startup.bat
type %CATALINA_HOME%\logs\catalina.out
```

## Paso 3: Acceder a la aplicación

- **URL**: http://localhost:8080/uniext
- **Login**: admin@uniext.com / admin123

## Características disponibles

✅ **Autenticación**: Login y registro de usuarios
✅ **Dashboard**: Panel de control con estadísticas
✅ **Gestión de Usuarios**: CRUD de usuarios
✅ **Herramientas**: Calculadora de primos, factorial, estadísticas
✅ **Reportes**: Panel de generación de reportes
✅ **API REST**: Endpoints JSON funcionales
✅ **Responsive**: Diseño adaptable a móviles
✅ **Seguridad**: Headers de seguridad configurados

## Endpoints disponibles

### Páginas JSP:
- `/uniext/` - Página principal
- `/uniext/login.jsp` - Login
- `/uniext/register.jsp` - Registro
- `/uniext/dashboard.jsp` - Dashboard
- `/uniext/usuarios.jsp` - Gestión de usuarios
- `/uniext/herramientas.jsp` - Herramientas

### APIs REST:
- `GET /uniext/api/dashboard` - Información del dashboard
- `GET /uniext/api/usuarios` - Listar usuarios
- `POST /uniext/api/usuarios` - Crear usuario
- `POST /uniext/api/auth` - Autenticación
