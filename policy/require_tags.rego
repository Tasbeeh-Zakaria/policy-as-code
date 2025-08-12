package policy

# deny is a set of violation messages
deny[msg] {
    not input_contains_environment_tag
    msg := "The 'environment' tag is required"
}

# Helper function: checks if any resource has the environment tag
input_contains_environment_tag {
    some rc
    rc := input.resource_changes[_]
    rc.change.after.tags.environment
}
