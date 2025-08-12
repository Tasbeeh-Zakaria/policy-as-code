package policy

test_environment_tag_present {
    test_input := {"resource": {"tags": {"environment": "dev"}}}
    not deny with input as test_input
}

test_environment_tag_missing {
    test_input := {"resource": {"tags": {}}}
    count(deny with input as test_input) > 0
}
