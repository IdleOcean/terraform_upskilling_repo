provider "github" {
    token = var.github-token
}

resource "github_repository" "Terraform-upskilling" {
    name = "terraform_upskilling_repo" 
    description = "Test"
    visibility = "public"
}