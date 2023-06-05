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
  name        = "teraaform-project-new"
  description = "This is my first repository"
  visibility  = "public"
}
