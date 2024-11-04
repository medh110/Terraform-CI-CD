variable "codepipeline-name" {
  description = "Name of codepipeline"
  type        = string
  default     = ""
}
variable "codestar-connection" {
  type    = string
  default = ""
}
variable "s3-name" {
  description = "ARN of the S3 bucket used in the IAM policy"
  type        = string
  default     = ""
}
variable "role-arn" {
  description = "Arn of codepipeline role"
  default     = ""
}
variable "codebuild-project-name" {
  description = "Name of codebuild project"
  default     = ""
}
