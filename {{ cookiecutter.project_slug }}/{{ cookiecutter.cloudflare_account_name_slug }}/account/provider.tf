terraform {
  backend "s3" {
    bucket = "{{ cookiecutter.r2_bucket_name }}"
    key    = "{{ cookiecutter.cloudflare_account_name_slug }}/account.tfstate"

    region                      = "auto"
    skip_region_validation      = true
    skip_metadata_api_check     = true
    skip_credentials_validation = true
    force_path_style            = true
    # endpoint                  = AWS_S3_ENDPOINT

    /*
      ENVIRONMENT VARIABLES
      ---------------------
      AWS_ACCESS_KEY_ID     - R2 token
      AWS_SECRET_ACCESS_KEY - R2 secret
      AWS_S3_ENDPOINT       - R2 location: https://{{ cookiecutter.cloudflare_account_id }}.r2.cloudflarestorage.com
    */
  }
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.25.0"
    }
  }
}

provider "cloudflare" {
  /*
    ENVIRONMENT VARIABLES
    ---------------------
    CLOUDFLARE_EMAIL & CLOUDFLARE_API_KEY
    or CLOUDFLARE_API_TOKEN
  */
}
