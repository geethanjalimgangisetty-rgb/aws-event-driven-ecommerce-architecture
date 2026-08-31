module "iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "= 6.8.0"
  name        = "github_runner_access_policy"
  description = "custom policy for github runner to access the aws resource"

  # Define the actual policy permissions
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
            "s3:*",
            "dynamodb:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
  tags = {
    dataClass = "infrastructure-pipeline"
  }
}
# Role created to provide github runner to access aws for planning and deploying
module "iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role"
  version = "= 6.0.0"
  name = "github_runner_access_role"
  description = "This role is created for the github runner to access aws for deployment"
  enable_github_oidc = true
  oidc_wildcard_subjects = ["repo:${var.github_repo_name}:*"] #try to pass run time
  # Attach managed or custom policies
  policies = {
    github_runner_policy = module.iam_policy.arn
  }
  tags = {
    dataClass = "infrastructure-pipeline"
  }
}