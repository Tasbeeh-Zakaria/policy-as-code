package policy

test_environment_tag_present if {
  input := {"resource": {"tags": {"environment": "dev"}}}
  not deny with input as input
}

test_environment_tag_missing if {
  input := {"resource": {"tags": {}}}
  deny with input as input
}
