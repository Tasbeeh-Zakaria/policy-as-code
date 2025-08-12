package main

# Fail if any resource is missing 'environment'
deny[msg] {
  not input.resource_changes[_].change.after.triggers.environment
  msg := "Resource missing required 'environment' tag"
}
