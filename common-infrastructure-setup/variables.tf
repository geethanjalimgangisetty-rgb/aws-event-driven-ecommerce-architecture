
    variable "aws_region" {
        type = string
        default = "ap-southeast-2"
        description = "this will be the default deployment region in aws"
    }

   variable "github_repo_name" {
    type = string
    description = "holds the repo name (temporary setup)"
    default = "geethanjalimgangisetty-rgb*/payment-processing-app-aws*"
   }

   variable "user_name" {
    type = string
    description = " user that is provisioning the resources"
    default = "payment_processor_admin"
   }