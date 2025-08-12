package policy

# PASS: environment tag is present and non-empty
test_environment_tag_present {
  not deny with input as {
    "resource_changes": [
      {
        "address": "null_resource.example",
        "change": {
          "after": {
            "tags": { "environment": "dev" }
          }
        }
      }
    ]
  }
}

# FAIL: tag missing
test_environment_tag_missing {
  some m
  deny[m] with input as {
    "resource_changes": [
      {
        "address": "null_resource.no_tag",
        "change": { "after": { "tags": {} } }
      }
    ]
  }
}

# FAIL: tag empty
test_environment_tag_empty {
  some m
  deny[m] with input as {
    "resource_changes": [
      {
        "address": "null_resource.empty_tag",
        "change": { "after": { "tags": { "environment": "" } } }
      }
    ]
  }
}
