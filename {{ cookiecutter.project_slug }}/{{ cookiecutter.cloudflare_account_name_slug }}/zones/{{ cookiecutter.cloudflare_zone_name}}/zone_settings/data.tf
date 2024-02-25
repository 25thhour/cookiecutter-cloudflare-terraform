data "cloudflare_zone" "{{ cookiecutter.cloudflare_zone_resource_name }}" {
  account_id = var.cloudflare_account_id
  name       = var.cloudflare_zone_name
}
