
    variable "aws_region" {
        type = string
        default = "ap-southeast-2"
        description = "this will be the default deployment region in aws"
    }

   /*  variable "backend_state_s3_bucket" {
        type =  string
        default = "payment_processor_backend_state_bucket"
        description = "Name of the bucket that holds the terraform state"
    }

    variable "backend_state_dynamo_table" {
        type = string
        default = "payment_processor_backend_state_table"
        description = "Name of the dynamo db table used for state lock during deployment"
    } 
    */
