terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  region = var.region
}
module "codebuild-role" {
  source                 = "./modules/iam-codebuild"
  codebuild-service-role = var.codebuild-service-role[terraform.workspace]
  codebuild-policy       = var.codebuild-policy[terraform.workspace]
  s3-arn                 = module.s3_bucket.s3-arn
}
module "ecr" {
  source   = "./modules/ECR"
  ecr-repo = var.ecr-repo[terraform.workspace]
}
module "s3_bucket" {
  source      = "./modules/S3 bucket"
  bucket-name = var.s3-bucket[terraform.workspace]
}
module "codebuild" {
  depends_on = [
    module.ecr,
  module.codebuild-role]
  source         = "./modules/codebuild-infra"
  codebuild-name = var.codebuild-name[terraform.workspace]
  arn            = module.codebuild-role.arn
  codebuild_params = {
    "BITBUCKET_REPO" = "[repo url]"
    "IMAGE"          = "aws/codebuild/amazonlinux2-aarch64-standard:3.0"
    "TYPE"           = "ARM_CONTAINER"
    "COMPUTE_TYPE"   = "BUILD_GENERAL1_SMALL"
    "CRED_TYPE"      = "CODEBUILD"
  }
  environment_variables = {
    "AWS_DEFAULT_REGION" = "ap-south-1"
    "AWS_ACCOUNT_ID"     = "[ID]"
    "IMAGE_REPO_NAME"    = terraform.workspace == "production" ? "project-prod" : "project-staging"
    "IMAGE_TAG"          = "latest"

  }
}
module "codepipeline-role" {
  source                    = "./modules/iam-codepipeline"
  codepipeline-service-role = var.codepipeline-service-role[terraform.workspace]
  codepipeline-policy       = var.codepipeline-policy[terraform.workspace]
}
module "codepipeline" {
  depends_on = [
    module.codebuild
  ]
  source            = "./modules/codepipeline-infra"
  codepipeline-name = var.codepipeline-name[terraform.workspace]
  role-arn          = module.codepipeline-role.role-arn

  codestar-connection    = var.codestar-connection
  s3-name                = module.s3_bucket.s3-name
  codebuild-project-name = module.codebuild.name
}