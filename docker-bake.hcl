// docker-bake.hcl

// Variable para el SHA del commit, será poblada por la variable de entorno del workflow
variable "GIT_SHA" { default = "latest" }

// Target para la validación de la aplicación/imagen
target "app-check" {
  dockerfile = "Dockerfile"    // Apunta al Dockerfile que creamos
  context    = "."             // El contexto de compilación es el directorio actual
  // Etiquetas locales para la validación con Bake.
  // No incluyen el nombre de usuario ya que `push: false` en el workflow para Bake.
  tags       = ["local/validacion-app-bake-check:${GIT_SHA}"]
  // platforms  = ["linux/amd64"] // Puedes especificar plataformas si es necesario
}

// Target opcional para un 'release', si quisieras que Bake también hiciera push.
// Requiere que DOCKERHUB_USERNAME (con valor 'itzel9') esté disponible como variable de entorno para Bake.
/*
variable "DOCKERHUB_USERNAME" { default = "itzel9" } // Puedes definirla aquí o pasarla como env

target "app-release" {
  inherits   = ["app-check"] // Hereda configuraciones de app-check
  tags       = [
    "${DOCKERHUB_USERNAME}/validacion_docker:${GIT_SHA}",
    "${DOCKERHUB_USERNAME}/validacion_docker:latest"
  ]
  // output = ["type=image,push=true"] // Para hacer push directamente desde Bake
}
*/

// Grupo por defecto que se ejecutará si no se especifica un target en el comando bake
group "default" {
  targets = ["app-check"]
}