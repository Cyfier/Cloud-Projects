variable "aws_region" {
  type        = string
}

variable "sso_instance_arn" {
  type        = string
}

variable "aws_account_id" {
  type = string
}

variable "readonly_permission_set_arn" {
  type = string
}

variable "poweruser_permission_set_arn" {
  type = string
}

variable "security_audit_permission_set_arn" {
  type = string
}

variable "cloud_readers_group_id" {
  type = string
}

variable "cloud_admins_group_id" {
  type = string
}

variable "security_engineers_group_id" {
  type = string
}