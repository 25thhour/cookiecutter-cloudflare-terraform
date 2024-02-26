resource "cloudflare_access_application" "app_name" {
  zone_id = data.cloudflare_zone.{{ cookiecutter.cloudflare_zone_resource_name }}.id
  # ...
}
