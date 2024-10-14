provider "aws" {
  alias = "account1"
  region = "eu-west-1"
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}