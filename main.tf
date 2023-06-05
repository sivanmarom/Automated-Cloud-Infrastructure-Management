provider "aws" {
  region = "us-east-1"
  access_key = "AKIAZ2ZGJFF3AIUMO2OM"
  secret_key = "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"
}

module "ec2" {
  source = "./modules/ec2-module"
}
module "agents" {
  source = "./modules/agents-module"
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
