resource "cloudflare_ruleset" "cache_settings_example" {
  zone_id = data.cloudflare_zone.{{ cookiecutter.cloudflare_zone_resource_name }}.id
  name    = "custom cache settings"
  kind    = "zone"
  phase   = "http_request_cache_settings"
  # ...

  rules {
    action = "set_cache_settings"
    # ...
    expression = ""
    enabled    = true
  }
}
