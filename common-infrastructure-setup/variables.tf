
variable "aws_region" {
  type        = string
  default     = "ap-southeast-2"
  description = "this will be the default deployment region in aws"
}

variable "github_repo_name" {
  type        = string
  description = "holds the repo name (temporary setup)"
  default     = "geethanjalimgangisetty-rgb*/payment-processing-app-aws*"
}
# to do-  refactor to git hub secrets
variable "s3_bucket_name" {
  type        = string
  description = "holds the bucket name"
  default     = "payment-processor-app-backend-state-bucket"
}

variable "user_name" {
  type        = string
  description = " user that is provisioning the resources"
  default     = "payment_processor_admin"
}
variable "dynamo_table" {
  type        = string
  description = "holds the table name"
  default     = "payment_processor_backend_state_table"
}

variable "account" {
  type        = string
  description = "holds the account id"
  default     = "797661577413"
}
