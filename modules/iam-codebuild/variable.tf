variable "codebuild-service-role" {
  description = "Name of the service role of codebuild"
  type        = string
}

variable "codebuild-policy" {
  description = "Name of the codebuild policy attached to the service role"
  type        = string
}

variable "s3-arn" {
  description = "ARN of the S3 bucket used in the IAM policy"
  type        = string
}
