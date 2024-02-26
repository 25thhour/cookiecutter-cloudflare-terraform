resource "cloudflare_load_balancer" "example" {
  zone_id          = data.cloudflare_zone.{{ cookiecutter.cloudflare_zone_resource_name }}.id
  name             = "example-load-balancer.${var.cloudflare_zone_name}"
  fallback_pool_id = cloudflare_load_balancer_pool.example.id
  default_pool_ids = [cloudflare_load_balancer_pool.example.id]
  proxied          = true
  # ...
}

resource "cloudflare_load_balancer_pool" "example" {
  account_id = var.cloudflare_account_id
  name       = "example-lb-pool"
  origins {
    name    = "example-1"
    address = "10.1.10.1"
    enabled = true
    header {
      header = "Host"
      values = ["example-1"]
    }
    # ...
  }
}

# HTTP
resource "cloudflare_load_balancer_monitor" "example" {
  account_id     = var.cloudflare_account_id
  type           = "http"
  expected_body  = "alive"
  expected_codes = "2xx"
  method         = "GET"
  timeout        = 7
  path           = "/health"
  interval       = 60
  retries        = 5
  description    = "example http load balancer"
  header {
    header = "Host"
    values = ["example.com"]
  }
  allow_insecure   = false
  follow_redirects = true
  probe_zone       = var.cloudflare_zone_name
}
