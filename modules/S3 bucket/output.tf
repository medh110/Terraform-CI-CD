output "s3-arn" {
  value = aws_s3_bucket.s3_bucket.arn
}
output "s3-name" {
  value = aws_s3_bucket.s3_bucket.bucket
}