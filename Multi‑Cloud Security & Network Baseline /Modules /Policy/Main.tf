# Deny Wildcard Permissions

resource "aws_iam_policy" "deny_wildcards" {
  name        = "DenyWildcardPermissions"
  description = "Deny IAM policies with wildcard actions or resources"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Deny",
        "Action": "iam:CreatePolicy",
        "Resource": "*",
        "Condition": {
          "StringLike": {
            "iam:PolicyDocument": "*\"Action\":\"*\"*"
          }
        }
      }
    ]
  })
}

# Tagging

resource "aws_iam_policy" "require_tags" {
  name = "RequireTags"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Deny",
        Action = "*",
        Resource = "*",
        Condition = {
          Null = {
            "aws:RequestTag/Owner" = "true"
          }
        }
      }
    ]
  })
}

# Deny Public Buckets

resource "aws_s3_account_public_access_block" "block_public" {
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}