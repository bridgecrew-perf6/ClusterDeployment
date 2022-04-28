variable "availability_zones" {
  description = "List of availability zones for the selected region"
  type        = list(string)
  default     = ["us-east-1", "us-east-2"]
}

variable "region" {
  description = "AWS region to deploy to"
  type        = string
  default     = "us-east-1"
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
