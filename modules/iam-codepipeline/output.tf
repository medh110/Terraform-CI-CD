output "role-arn" {
  description = "ARN of the created service role for CodeBuild"
  value       = aws_iam_role.codepipeline-service-role.arn
}
