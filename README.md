# UNIEXT - Proyecto Tomcat

Proyecto web basado en Tomcat para aplicaciones empresariales.

## Requisitos

- **Java**: JDK 11 o superior
- **Maven**: 3.6 o superior
- **Tomcat**: 9.x o superior
- **Base de datos**: MySQL 5.7+ o PostgreSQL 10+

## Instalación Rápida

### Linux/Mac
```bash
chmod +x scripts/setup.sh
./scripts/setup.sh
```

### Windows
```cmd
scripts\setup.bat
```

## Estructura del Proyecto

- `src/` - Código fuente (Java, JSP, recursos)
- `config/` - Archivos de configuración
- `scripts/` - Scripts de instalación y despliegue
- `docs/` - Documentación

## Compilación

```bash
mvn clean install
```

## Despliegue

### Manual
```bash
mvn clean package
cp target/uniext.war $CATALINA_HOME/webapps/
```

### Automático
```bash
./scripts/deploy.sh
```

## Docker

```bash
docker-compose up -d
```

## Configuración

Ver `docs/CONFIGURACION.md` para detalles de configuración.

## Licencia

Proprietary © 2026
