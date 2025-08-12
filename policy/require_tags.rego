package main

# Deny if "environment" tag is missing or empty
deny[msg] {
  input.resource_changes[_].change.after.tags.environment == ""
  msg := "Resource missing required 'environment' tag"
}
