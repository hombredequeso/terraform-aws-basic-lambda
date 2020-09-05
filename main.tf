resource "aws_lambda_function" "lambda" {
   function_name = var.lambda_name

   # The bucket name as created earlier with "aws s3api create-bucket"
   s3_bucket = var.lambda_s3_bucket
   s3_key    = var.lambda_s3_key

   # "main" is the filename within the zip file (main.js) and "handler"
   # is the name of the property under which the handler function was
   # exported in that file.
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
