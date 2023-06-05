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
