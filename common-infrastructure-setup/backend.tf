terraform {
    backend "s3" {
        bucket = "payment-processor-backend-state-bucket"
        key = "terraform.tfstate"
        region = "ap-southeast-2"
        dynamodb_table = "payment_processor_backend_state_table"
    }
}