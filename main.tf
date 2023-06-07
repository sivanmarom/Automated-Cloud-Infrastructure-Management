provider "aws" {
  region = "us-east-1"  
  
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

