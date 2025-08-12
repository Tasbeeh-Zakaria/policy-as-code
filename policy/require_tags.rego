package main

# Rule to check if "environment" tag is missing
deny[msg] {
  rc := input.resource_changes[_]
  not rc.change.after.tags.environment
  msg := "Resource missing required 'environment' tag"
}
