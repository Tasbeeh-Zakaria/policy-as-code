package policy

# Set rule (v1 style): add a message to `deny` if env tag is missing
deny contains msg if {
  not input.resource.tags.environment
  msg := "The 'environment' tag is required"
}
