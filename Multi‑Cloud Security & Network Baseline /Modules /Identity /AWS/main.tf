provider "aws" {
  region = var.aws_region
}

# READ ONLY PERMISSION SET

resource "aws_ssoadmin_permission_set" "readonly" {
  name             = "ReadOnly"
  instance_arn     = var.sso_instance_arn
  session_duration = "PT4H"
  description      = "Read-only access for cloud resources"
}

resource "aws_ssoadmin_managed_policy_attachment" "readonly_attach" {
  instance_arn       = var.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.readonly.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

# POWER USER PERMISSION SET

resource "aws_ssoadmin_permission_set" "poweruser" {
  name             = "PowerUser"
  instance_arn     = var.sso_instance_arn
  session_duration = "PT4H"
  description      = "PowerUser access without IAM privileges"
}

resource "aws_ssoadmin_managed_policy_attachment" "poweruser_attach" {
  instance_arn       = var.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.poweruser.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

# SECURITY AUDIT PERMISSION SET

resource "aws_ssoadmin_permission_set" "security_audit" {
  name             = "SecurityAudit"
  instance_arn     = var.sso_instance_arn
  session_duration = "PT4H"
  description      = "Security auditing and monitoring permissions"
}

resource "aws_ssoadmin_managed_policy_attachment" "security_audit_attach" {
  instance_arn       = var.sso_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.security_audit.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}