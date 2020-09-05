resource "aws_lambda_function" "lambda" {
   function_name = var.lambda_name

   s3_bucket = var.lambda_s3_bucket
   s3_key    = var.lambda_s3_key

   handler = "index.handler"
   runtime = "nodejs12.x"
   role = aws_iam_role.lambda_exec.arn

   tags = var.common_tags

  depends_on = [
    aws_iam_policy_attachment.policy_attachment,
    aws_cloudwatch_log_group.lambda_log_group,
  ]
}

resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/${var.lambda_name}"
  retention_in_days = 1
}

resource "aws_iam_role" "lambda_exec" {
  name = "${var.lambda_name}-role"
  tags = var.common_tags
  assume_role_policy = templatefile("${path.module}/templates/role-trust-relationships.tpl", {})
}

resource "aws_iam_policy" "cloudwatch_policy" {
  name = "${var.lambda_name}-cloudwatchpolicy"

  policy = templatefile("${path.module}/templates/cloudwatch-policy.tpl", {})
}

resource "aws_iam_policy_attachment" "policy_attachment" {
  name       = "attachment"
  roles      = ["${aws_iam_role.lambda_exec.name}"]
  policy_arn = aws_iam_policy.cloudwatch_policy.arn
} 
