package policy

test_environment_tag_present {
    some msg
    msg := "The 'environment' tag is required"
    msg in deny with input as test_input
}

# Should PASS (tag missing -> deny contains message)
test_environment_tag_missing {
  test_input := {"resource": {"tags": {}}}
  deny contains "The 'environment' tag is required" with input as test_input
}
