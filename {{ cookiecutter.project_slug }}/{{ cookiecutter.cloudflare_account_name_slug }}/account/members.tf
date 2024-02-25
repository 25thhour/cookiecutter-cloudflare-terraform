data "cloudflare_account_roles" "account_roles" {
  account_id = var.cloudflare_account_id
}

locals {
  roles_by_name = {
    for role in data.cloudflare_account_roles.account_roles.roles :
    role.name => role
  }
}

# Administrator Read Only
resource "cloudflare_account_member" "ro_admins" {
  for_each = var.role_ro_administrators

  account_id    = var.cloudflare_account_id
  email_address = each.key
  role_ids = [
    local.roles_by_name["Administrator Read Only"].id
  ]
}

# Administrator
resource "cloudflare_account_member" "rw_admins" {
  for_each = var.role_rw_administrators

  account_id    = var.cloudflare_account_id
  email_address = each.key
  role_ids = [
    local.roles_by_name["Administrator"].id
  ]
}
