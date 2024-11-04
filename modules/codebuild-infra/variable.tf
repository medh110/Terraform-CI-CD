variable "codebuild-name" {
  description = "Codebuild project name"
  type        = string
  default = ""
}

variable "codebuild_params" {
  description = "Codebuild parameters"
  type        = map(string)
}

variable "environment_variables" {
  description = "Environment variables"
  type        = map(string)
}

variable "arn" {
  description = "arn of codebuild role"
  default     = ""
}