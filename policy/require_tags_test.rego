package main

# Test passes when environment tag exists
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

# Test fails when environment tag is missing
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
