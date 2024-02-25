variable "cloudflare_account_id" { default = "{{ cookiecutter.cloudflare_account_id }}" }

# Administrator Read Only
variable "role_ro_administrators" {
  description = "Users with the Administrator Read Only role"
  type        = set(string)
  default = [
    ""
  ]
}

# Administrator
variable "role_rw_administrators" {
  description = "Users with the Administrator role"
  type        = set(string)
  default = [
    ""
  ]
}
