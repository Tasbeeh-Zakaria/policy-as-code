package policy

deny[msg] if {
  not input.resource.tags["environment"] == "dev"
  msg := "Missing environment tag"
}
