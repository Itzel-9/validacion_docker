# Dockerfile
FROM alpine:latest

# Instala tini, un gestor de init simple
RUN apk add --no-cache tini

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el contenido del contexto de compilación al directorio de trabajo
# Para este ejemplo simple, no hay mucho que copiar, pero es una práctica común.
# Si tuvieras archivos de aplicación, se copiarían aquí.
COPY . .

# Configura tini como el proceso principal que ejecutará el CMD
ENTRYPOINT ["/sbin/tini", "--"]

# Comando por defecto que se ejecutará al iniciar el contenedor
CMD ["echo", "Hola desde Docker! Validado por itzel9 para validacion_docker!"]