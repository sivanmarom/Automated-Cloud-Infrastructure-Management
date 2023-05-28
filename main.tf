provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "./modules/ec2-module"
}

module "s3" {
  source = "./modules/s3-module"
}

module "iam" {
  source = "./modules/iam-module"
}

module "dynamodb" {
  source = "./modules/dynamodb-module"
}

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}
provider "github" {
  token = "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"
}
module "github" {
  source = "./modules/github-module"

}
