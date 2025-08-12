package main

test_pass_environment_tag {
    not deny with input as {
        "resource_changes": [
            {
                "change": {
                    "after": {
                        "triggers": { "environment": "dev" }
                    }
                }
            }
        ]
    }
}

test_fail_missing_tag {
    deny with input as {
        "resource_changes": [
            {
                "change": {
                    "after": {
                        "triggers": {}
                    }
                }
            }
        ]
    }
}
