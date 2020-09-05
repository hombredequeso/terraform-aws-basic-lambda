output "lambda_role" {
  description = "lambda role name, so extra policies can be added to role"
  value = aws_iam_role.lambda_exec.name
}
