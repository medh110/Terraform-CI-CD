variable "codepipeline-service-role" {
  description = "Name for the CodeBuild IAM role"
  default     = "project-codepipeline-role"
}
variable "codepipeline-policy" {
  description = "Name for the CodeBuild IAM role"
  default     = "project-codepipeline-policy"
}