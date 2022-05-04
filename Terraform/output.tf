output "user_access_keys" {
  value     = aws_iam_access_key.archieKey
  sensitive = true
}

output "db_arn" {
  value = module.db.db_instance_arn
}

output "db_address" {
  value = module.db.db_instance_address
}

output "db_endpoint" {
  value = module.db.db_instance_endpoint
}

output "db_username" {
  value = module.db.db_instance_username
  sensitive = true
}

output "db_password" {
  value = module.db.db_instance_password
  sensitive = true
}

output "s3_arn" {
  value = aws_s3_bucket.s3.s3_bucket_arn
}
