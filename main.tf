terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}



#create instance

resource "aws_instance" "Website" {
  ami           = "ami-04cb4ca688797756f"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

#first file for the Terraform repo
