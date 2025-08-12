package policy

# Positive test - should pass (no deny)
test_environment_tag_present {
    not deny[_] with input as {
        "resource_changes": [{
            "change": {
                "after": {
                    "tags": {
                        "environment": "dev"
                    }
                }
            }
        }]
    }
}

# Negative test - should fail (deny contains the message)
test_environment_tag_missing {
    deny[_] == "The 'environment' tag is required" with input as {
        "resource_changes": [{
            "change": {
                "after": {
                    "tags": {}
                }
            }
        }]
    }
}
