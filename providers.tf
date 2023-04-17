terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "${var.region}"
  
}

/*8terraform {

  backend "s3" {
    bucket = "webaapprojects"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
*/