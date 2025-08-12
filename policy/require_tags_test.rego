package main

# Pass case: environment tag is present
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

# Fail case: environment tag is missing
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
