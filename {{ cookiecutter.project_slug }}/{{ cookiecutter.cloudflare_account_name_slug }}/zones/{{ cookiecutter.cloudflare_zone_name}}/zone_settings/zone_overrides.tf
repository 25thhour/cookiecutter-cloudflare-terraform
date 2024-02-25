resource "cloudflare_zone_settings_override" "{{ cookiecutter.cloudflare_zone_resource_name }}" {
  zone_id = data.cloudflare_zone.{{ cookiecutter.cloudflare_zone_resource_name }}.zone_id

  settings {
    brotli = "on"
  }
}
