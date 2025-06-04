# Dockerfile
FROM alpine:3.18 # Solución para DL3007

# Solución para DL3018 - Opción 1: Fijar versión de tini (ejemplo, verifica la versión actual)
# RUN apk add --no-cache tini=0.19.0
# Solución para DL3018 - Opción 2: Dejarlo como está si es difícil fijar o decides aceptar la advertencia
RUN apk add --no-cache tini

WORKDIR /app
COPY . .
ENTRYPOINT ["/sbin/tini", "--"]

# Tu CMD ya está en formato JSON, lo cual es bueno.
# Si DL3025 persiste y estás segura de que es correcto, podrías ignorar esta regla en Hadolint.
CMD ["echo", "Hola desde Docker! Validado por itzel-9 para validacion_docker!"]