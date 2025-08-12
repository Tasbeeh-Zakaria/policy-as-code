package main

# Test passes if environment tag present
test_pass_environment_tag {
    not deny with input as {
        "resource_changes": [
            {
                "change": {
                    "after": {
                        "tags": { "environment": "dev" }
                    }
                }
            }
        ]
    }
}

# Test fails if environment tag is missing
test_fail_missing_tag {
    deny with input as {
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
