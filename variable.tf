variable "region" {
  description = "Region"
  type        = string
  default     = "ap-south-1"
}
variable "codebuild-service-role" {
  description = "Name of codebuild service role"
  type        = map(string)
  default = {
    production = "project-codebuild-role"
    staging    = "project-codebuild-role-staging"
  }
}
variable "codepipeline-service-role" {
  description = "Name of codepipeline service role"
  type        = map(string)
  default = {
    production = "project-codepipeline-role"
    staging    = "project-codepipeline-role-staging"
  }
}
variable "codepipeline-policy" {
  description = "Name of codepipeline policy attached to the service role"
  type        = map(string)
  default = {
    production = "project-codepipeline-policy"
    staging    = "project-codepipeline-policy-staging"
  }
}
variable "codebuild-policy" {
  description = "Name of codebuild policy attached to the service role"
  type        = map(string)
  default = {
    production = "project-codebuild-policy"
    staging    = "project-codebuild-policy-staging"
  }
}
variable "ecr-repo" {
  description = "Name of ecr repo"
  type        = map(string)
  default = {
    production = "project-prod"
    staging    = "project-staging"
  }
}
variable "image-repo-name" {
  description = "Name of container image"
  type        = map(string)
  default = {
    production = "project-prod"
    staging    = "project-staging"
  }
}
variable "s3-bucket" {
  type = map(string)
  default = {
    production = "project-artifact-prod"
    staging    = "project-artifact-staging"
  }
}
variable "codebuild-name" {
  description = "Name of codebuild"
  type        = map(string)
  default = {
    production = "project-prod-codebuild"
    staging    = "project-staging-codebuild"
  }
}
variable "codepipeline-name" {
  description = "Name of codepipeline"
  type        = map(string)
  default = {
    production = "project-prod-codepipeline"
    staging    = "project-staging-codepipeline"
  }
}
variable "codestar-connection" {
  description = "Codestar connection to github repo"
  type        = string
}