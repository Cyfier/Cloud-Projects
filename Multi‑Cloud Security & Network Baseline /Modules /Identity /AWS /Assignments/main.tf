provider "aws" {
  region = var.aws_region
}

resource "aws_ssoadmin_account_assignment" "readonly_assignment" {
  instance_arn       = var.sso_instance_arn
  permission_set_arn = var.readonly_permission_set_arn
  principal_id       = var.cloud_readers_group_id
  principal_type     = "GROUP"
  target_id          = var.aws_account_id
  target_type        = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_account_assignment" "poweruser_assignment" {
  instance_arn       = var.sso_instance_arn
  permission_set_arn = var.poweruser_permission_set_arn
  principal_id       = var.cloud_admins_group_id
  principal_type     = "GROUP"
  target_id          = var.aws_account_id
  target_type        = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_account_assignment" "security_audit_assignment" {
  instance_arn       = var.sso_instance_arn
  permission_set_arn = var.security_audit_permission_set_arn
  principal_id       = var.security_engineers_group_id
  principal_type     = "GROUP"
  target_id          = var.aws_account_id
  target_type        = "AWS_ACCOUNT"
}