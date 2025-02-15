resource "aws_ecr_repository" "project-repository" {
  name                 = var.ecr-repo
  image_tag_mutability = "MUTABLE"


  image_scanning_configuration {
    scan_on_push = false
  }
}
