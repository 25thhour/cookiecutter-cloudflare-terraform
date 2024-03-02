terraform {
  backend "s3" {
    bucket = "{{ cookiecutter.r2_bucket_name }}"
    key    = "{{ cookiecutter.r2_tfstate_key }}"

    region                      = "auto"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    use_path_style              = true
    # endpoint                  = AWS_ENDPOINT_URL_S3

    /*
      ENVIRONMENT VARIABLES
      ---------------------
      AWS_ACCESS_KEY_ID     - R2 token
      AWS_SECRET_ACCESS_KEY - R2 secret
      AWS_ENDPOINT_URL_S3   - R2 location: https://ACCOUNT_ID.r2.cloudflarestorage.com
    */
  }
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4"
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
