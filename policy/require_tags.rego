package policy

# Deny if the 'environment' tag is missing
deny[msg] {
    not input.resource_changes[_].change.after.tags.environment
    msg := "The 'environment' tag is required"
}
