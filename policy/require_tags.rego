package policy

deny[msg] {
  not input.resource.tags.environment
  msg := "The 'environment' tag is required"
}
