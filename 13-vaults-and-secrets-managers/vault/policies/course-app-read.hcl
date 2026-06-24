path "secret/data/docker-course" {
  capabilities = ["read"]
}

path "secret/metadata/docker-course" {
  capabilities = ["read", "list"]
}
