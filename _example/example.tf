provider "aws" {
  region = "eu-west-1"
}

module "iam-user" {
  source = "../"

  name        = "iam-user"
  application = "clouddrove"
  environment = "test"
  label_order = ["environment", "name", "application"]

  policy_enabled = true
  policy         = data.aws_iam_policy_document.default.json
}

data "aws_iam_policy_document" "default" {
  statement {
    actions = [
      "ec2:Describe*"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}