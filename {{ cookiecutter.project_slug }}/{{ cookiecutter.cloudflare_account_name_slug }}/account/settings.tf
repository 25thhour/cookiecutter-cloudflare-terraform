resource "cloudflare_account" "{{ cookiecutter.cloudflare_account_name_slug }}" {
  name              = "{{ cookiecutter.cloudflare_account_name_slug }}"
  type              = "enterprise"
  enforce_twofactor = true
}
