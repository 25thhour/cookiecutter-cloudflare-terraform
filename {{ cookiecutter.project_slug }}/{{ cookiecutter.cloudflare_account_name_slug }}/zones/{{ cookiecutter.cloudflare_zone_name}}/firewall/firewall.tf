resource "cloudflare_ruleset" "zone_level_managed_waf_with_category_based_overrides" {
  zone_id = data.cloudflare_zone.{{ cookiecutter.cloudflare_zone_resource_name }}.id
  name    = "custom firewall rules"
  kind    = "zone"
  phase   = "http_request_firewall_managed"
  # ...

  rules {
    action = "execute"
    # ...
    expression = ""
    enabled    = true
  }
}
