provider "aws" {
  region = "eu-west-2" 
  access_key = "AAAAAAAAAAAAAAAAAAAA"
  secret_key = "a00000000000000000001Lg74iG5I2M1Wzs4Ve2Kc"
}

data "archive_file" "zip_python_file" {
  type        = "zip"
  source_dir  = "${path.module}/python"
  output_path = "${path.module}/python/publisher.zip"
}

resource "aws_lambda_function" "example_lambda" {
  function_name = "lambda_function"
  s3_bucket = "vaishteratest"
  s3_key = "publisher.zip"  
  handler       = "publisher.lambda_handler"  # handler file and function name
  runtime       = "python3.9"  # desired runtime
  role          = "arn:aws:iam::264567323125:role/ENSLambdaMSKRole"  # actual ARN of your existing IAM role
}

resource "aws_s3_object" "example_file" {
  bucket = "vaishteratest"  # Name of the existing bucket
  key    = "publisher.zip"  # Key or path to the file in the bucket
  source = "${path.module}/python/publisher.zip"
}
# this file using exixting s3 bucket and puting the zipped publisher.py function to that bucket
