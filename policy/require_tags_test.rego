package policy

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
