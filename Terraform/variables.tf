variable "availability_zones" {
  description = "List of availability zones for the selected region"
  type        = list(string)
  default     = ["us-east-1", "us-east-2"]
}

variable "region" {
  description = "aws region to deploy to"
  type        = string
  default     = "us-east-1"
}

variable "iam_id" {
  description = "IAM access key ID"
  type = string
  sensitive = true
}

variable "iam_secret" {
  description = "IAM secret access key"
  type = string
  sensitive = true
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}