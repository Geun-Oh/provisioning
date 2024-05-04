data "sops_file" "secret-value" {
  source_file = "terraform.enc.json"
}
