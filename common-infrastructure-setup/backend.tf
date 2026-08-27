/* terraform {
    backend "s3" {
        bucket = "payment_processor_backend_state_bucket"
        key = "terraform.tfstate"
        region = "us-east-1"
        encryption = true
        dynamodb_table = "payment_processor_backend_state_table"
    }
} */