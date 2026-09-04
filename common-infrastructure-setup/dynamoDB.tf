module "dynamodb_table" {
  source       = "terraform-aws-modules/dynamodb-table/aws"
  version      = "= 4.2.0"
  name         = "payment_processor_backend_state_table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attributes = [
    {
      name = "LockID"
      type = "S"
    }
  ]

  tags = {
    dataClass = "infrastructure-state"
  }

}