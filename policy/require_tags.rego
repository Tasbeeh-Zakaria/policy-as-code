package main

# Passes if every resource has the "environment" tag.
deny[msg] {
  input.resource_changes[_].change.after.tags.environment == ""
  msg := sprintf("Resource missing required 'environment' tag")
}
