// docker-bake.hcl
variable "GIT_SHA" { default = "latest" }

// Target para la validación local
target "app-check" {
  dockerfile = "Dockerfile"
  context    = "."
  tags       = ["local/validacion-app-bake-check:${GIT_SHA}"]
}

// Target opcional para un 'release' a Docker Hub
// (Necesitaría que la variable DOCKERHUB_USERNAME con valor 'itzel-9' esté disponible para Bake)
/*
variable "DOCKERHUB_USERNAME" { default = "itzel-9" } // Usuario correcto

target "app-release" {
  inherits   = ["app-check"]
  tags       = [
    "${DOCKERHUB_USERNAME}/validacion_docker:${GIT_SHA}", // Usaría itzel-9/validacion_docker:...
    "${DOCKERHUB_USERNAME}/validacion_docker:latest"
  ]
  // output = ["type=image,push=true"]
}
*/

group "default" {
  targets = ["app-check"]
}