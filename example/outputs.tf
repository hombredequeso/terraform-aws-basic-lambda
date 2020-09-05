output "lambda_name" {
  description = "lambda name"
  value = locals.lambda_name
}

output "deployment_bucket" {
  description = "Name of the s3 deployment bucket"
  value = var.lambda_s3_bucket
}

output "deployment_path" {
  value = var.lambda_deployment_path
}

output "deployment_zipfile" {
  value = var.lambda_deployment_zipfile
}

output "deployment_path" {
  description = "Path within s3 bucket for the deployment zip, not including name of zip itself, or s3 bucket name"
  value = var.lambda_deployment_path
}

