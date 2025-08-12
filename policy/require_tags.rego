package main

# Deny if environment tag is missing
deny[msg] {
  some rc
  rc := input.resource_changes[_]
  not rc.change.after.tags.environment
  msg := "Resource missing required 'environment' tag"
}
