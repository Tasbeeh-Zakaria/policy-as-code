package policy

# Should PASS (tag present -> no denies)
test_environment_tag_present {
  test_input := {"resource": {"tags": {"environment": "dev"}}}
  not deny with input as test_input
}

# Should PASS (tag missing -> deny contains message)
test_environment_tag_missing {
  test_input := {"resource": {"tags": {}}}
  deny contains "The 'environment' tag is required" with input as test_input
}
