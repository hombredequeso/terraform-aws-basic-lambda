variable region {
  description = "AWS region of deployment"
  default = "ap-southeast-2"
}

variable "repository" {
  description = "Terraform project repository (for tagging purposes)"
}
variable "project_name" {
  description = "Project name (for tagging purposes)"
  default = "example-basic-lambda"
}

variable "lambda_s3_bucket" {
  description = "S3 bucket name where lambda zip is stored"
}

variable "lambda_deployment_path" {
  default = "example/basic-lambda"
}

variable "lambda_deployment_zipfile" {
  default = "v0.0.1.zip"
}

variable "lambda_name_prefix" {
  description = "lambda name (random id will be appended to this prefix)"
  default = "example-basic-lambda"
}

variable "owner" {
  description = "project owner (for tagging purposes)"
}
