variable "region" {
  description = "The name of the security group for the ALB"
  type        = string
  default     = "ap-southeast-2"
}

variable "db_username" {
  description = "The username for the database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}
