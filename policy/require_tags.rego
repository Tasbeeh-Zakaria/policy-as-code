package main

deny[msg] {
  not input.resource_changes[_].change.after.tags.environment
  msg := "Resource missing required 'environment' tag"
}
