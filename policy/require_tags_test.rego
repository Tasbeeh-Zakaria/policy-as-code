package policy

test_environment_tag_present if {
  test_input := {"resource": {"tags": {"environment": "dev"}}}
  not deny with input as test_input
}

test_environment_tag_missing if {
  test_input := {"resource": {"tags": {}}}
  deny with input as test_input
}
