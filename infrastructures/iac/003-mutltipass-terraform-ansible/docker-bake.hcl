target "ansible" {
  context = "."
  dockerfile = "Dockerfile"
  tags = [ "ansible:dev" ]
}