variable "lambda_name" {
  description = "Name of the lambda function"
}

variable "lambda_s3_bucket" {
  description = "S3 bucket name where lambda zip is stored"
}

variable "lambda_s3_key" {
  description = "S3 key in lambda_s3_bucket where lambda zip is stored"
}

variable "common_tags" {
  description = "Tags to add to resources"
  type = map(string)
}
