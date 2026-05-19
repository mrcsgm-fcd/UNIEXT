# Dockerfile para UNIEXT con Tomcat
FROM tomcat:9-jdk11-openjdk

# Metadatos
LABEL maintainer="UNIEXT Team"
LABEL description="Aplicación web UNIEXT basada en Tomcat"

# Variables de entorno
ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

# Eliminar aplicaciones por defecto
RUN rm -rf $CATALINA_HOME/webapps/ROOT $CATALINA_HOME/webapps/docs $CATALINA_HOME/webapps/examples

# Copiar archivo WAR
COPY target/uniext.war $CATALINA_HOME/webapps/ROOT.war

# Copiar configuración personalizada
COPY config/tomcat/context.xml $CATALINA_HOME/conf/context.xml
COPY config/tomcat/server.xml $CATALINA_HOME/conf/server.xml

# Crear directorios de logs
RUN mkdir -p $CATALINA_HOME/logs && chmod 755 $CATALINA_HOME/logs

# Exponer puerto
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD curl -f http://localhost:8080/ || exit 1

# Comando de inicio
CMD ["catalina.sh", "run"]
