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
resource "github_repository" "terraform_project" {
  name        = var.github_repo
  description = "This repository created by terraform"
  visibility  = "public"
  auto_init  = true
}

resource "github_branch_default" "default_main"{
  repository = github_repository.terraform_project.name
  branch     = var.github_main_branch
}

