output "arn" {
  description = "ARN of the created service role for CodeBuild"
  value       = aws_iam_role.codebuild-service-role.arn
}
