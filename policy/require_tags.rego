package policy

# Deny any Terraform plan change where the 'environment' tag is missing or empty.
# Expects Terraform plan JSON (terraform show -json tfplan > tfplan.json)

deny[msg] {
  rc := input.resource_changes[_]
  after := rc.change.after
  tags := after.tags

  # tag is missing
  not tags.environment
  msg := sprintf("Resource %q missing required tag 'environment'.", [rc.address])
}

deny[msg] {
  rc := input.resource_changes[_]
  after := rc.change.after
  tags := after.tags

  # tag present but empty
  tags.environment == ""
  msg := sprintf("Resource %q has empty 'environment' tag.", [rc.address])
}
