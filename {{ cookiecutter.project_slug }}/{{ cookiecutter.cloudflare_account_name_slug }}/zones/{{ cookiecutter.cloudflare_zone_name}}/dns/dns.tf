resource "cloudflare_zone" "{{ cookiecutter.cloudflare_zone_resource_name }}" {
  account_id = var.cloudflare_account_id
  zone       = var.cloudflare_zone_name
}

resource "cloudflare_record" "httpbin" {
  zone_id = data.cloudflare_zone.{{ cookiecutter.cloudflare_zone_resource_name }}.zone_id
  name    = "httpbin"
  type    = "CNAME"
  value   = "httpbin.org"
  proxied = true
}
