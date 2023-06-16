provider "aws" {
  region = "eu-west-2" 
  access_key = "AKkkkkkkkkkkkkkkkkkkkkkk"
  secret_key = "a0oo000000000000000000000000G5I2M1Wzs4Ve2Kc"
}

resource "aws_lambda_layer_version" "lambda_layer_creation" {
  filename = "${path.module}/layer/testLayer.zip"
  layer_name = "testLayer"
  compatible_runtimes = ["python3.9"]
}
