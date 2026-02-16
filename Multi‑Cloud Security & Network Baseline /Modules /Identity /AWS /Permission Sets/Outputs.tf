output "permission_sets" {
  value = {
    readonly       = aws_ssoadmin_permission_set.readonly.arn
    poweruser      = aws_ssoadmin_permission_set.poweruser.arn
    security_audit = aws_ssoadmin_permission_set.security_audit.arn
  }
}