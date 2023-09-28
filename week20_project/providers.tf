# Configure the AWS Provider
provider "aws" {
region = "us-east-1"
}

terraform {
  required_providers {
    serverscom = {
      source = "serverscom/serverscom"
      version = "0.3.1"
    }
  }
}

provider "serverscom" {
  # Configuration options
}