# 1. Custom Policy for GitHub Runner
module "iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "= 6.8.0"

  name        = "github_runner_access_policy"
  description = "Custom policy for github runner to access aws resources"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:*",
          "dynamodb:*"
        ]
        Resource = "*"
      }
    ]
  })

  tags = {
    dataClass = "infrastructure-pipeline"
  }
}

# 2. Role for GitHub Runner
module "iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role"
  version = "= 6.0.0"

  name        = "github_runner_access_role"
  description = "This role is created for the github runner to access aws for deployment"

  # Enforces GitHub OIDC Trust Policy construction
  enable_github_oidc     = true
  oidc_wildcard_subjects = [
    "repo:${var.github_repo_name}:*"
  ]
  # Attach custom policy as a map
  policies = {
    github_runner_policy = module.iam_policy.arn
  }

  tags = {
    dataClass = "infrastructure-pipeline"
  }
}