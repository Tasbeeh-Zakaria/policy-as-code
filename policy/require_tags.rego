package policy

# Deny if environment tag is missing
deny[msg] {
    not input.resource.tags.environment
    msg := "The 'environment' tag is required"
}
