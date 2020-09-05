provider "aws" {  
  /* these will be provided via the execution environment */
  /* access_key = var.access_key */
  /* secret_key = var.secret_key */
  region     = var.region
}

terraform {
  required_version = "~> 0.12.28"
  required_providers {
    aws = "~> 3.3.0"
    random = "~> 2.3"
    template = "~> 2.1"
  }
}

resource "random_id" "id" {
	  byte_length = 8
}

locals  {
  lambda_name = "${var.lambda_function_name_prefix}-${random_id.id.hex}"
}

module "lambda" {
  source = "../"

  lambda_name = locals.lambda_name
  lambda_s3_bucket = var.lambda
  lambda_s3_key = 
  common_tags = local.common_tags
}

