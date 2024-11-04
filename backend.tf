terraform {
  backend "s3" {
    bucket = "terraform-state-project"
    key    = "terraform.tfstate"
    region = "ap-south-1"

    workspace_key_prefix = "workspaces"
  }
}
