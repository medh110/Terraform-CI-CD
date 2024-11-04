output "codebuild-iam-arn" {
  value       = module.codebuild-role.arn
  description = "The ARN of the IAM Role used by the Codebuild"
}
output "s3-bucket-arn" {
  value = module.s3_bucket.s3-arn
}
output "codepipeline-iam-arn" {
  value = module.codepipeline-role.role-arn
}