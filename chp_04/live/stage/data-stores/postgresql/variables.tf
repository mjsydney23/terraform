variable "region" {
  description = "The name of the security group for the ALB"
  type        = string
  default     = "ap-southeast-2"
}

# Pass sensitive value via environment variables
# export TF_VAR_db_username="(database user name)"
# export TF_VAR_db_password="(database password)"

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
