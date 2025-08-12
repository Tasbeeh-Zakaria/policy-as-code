package policy

# Test case: environment tag present
test_environment_tag_present {
    test_input := {"resource": {"tags": {"environment": "dev"}}}
    not deny with input as test_input
}

# Test case: environment tag missing
test_environment_tag_missing {
    test_input := {"resource": {"tags": {}}}
    count(deny with input as test_input) > 0
}
