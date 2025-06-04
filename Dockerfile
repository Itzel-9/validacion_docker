# Dockerfile
FROM alpine:latest
RUN apk add --no-cache tini
WORKDIR /app
COPY . .
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["Validacion Docker¨]