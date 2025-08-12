package policy

test_environment_tag_present {
    some test_input
    deny[test_input]           # reference your deny set
    test_input contains "The 'environment' tag is required"
}
