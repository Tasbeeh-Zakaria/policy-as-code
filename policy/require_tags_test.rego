package policy

# Test when the environment tag is missing
test_environment_tag_missing {
    some msg
    msg := "The 'environment' tag is required"
    msg in deny with input as {
        "resource_changes": [
            {
                "change": {
                    "after": {
                        "tags": {}
                    }
                }
            }
        ]
    }
}

# Test when the environment tag is present
test_environment_tag_present {
    count(deny with input as {
        "resource_changes": [
            {
                "change": {
                    "after": {
                        "tags": {
                            "environment": "dev"
                        }
                    }
                }
            }
        ]
    }) == 0
}
