provider "aws" {
  region = "us-east-1"  
  access_key = "AKIAZ2ZGJFF3DG4TS5UB"
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

module "github" {
  source = "./modules/github-module"

}

module "cloud-watch"{
  source = "./modules/cloud-watch-module"
}
module "load-balancer" {
  source = "./modules/load-balancer-module"
  
}

