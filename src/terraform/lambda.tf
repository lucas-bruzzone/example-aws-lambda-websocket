module "lambda_function" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 4.7"

  function_name = "${var.project_name}-properties-${var.environment}"
  source_path   = "../code"
  layers        = [module.lambda_layer.lambda_layer_arn]
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.11"
  timeout       = 30
  memory_size   = 512

  # create_role = false
  # lambda_role = aws_iam_role.lambda.arn

  # environment_variables = {
  #   CONNECTIONS_TABLE  = data.terraform_remote_state.websocket_api.outputs.connections_table_name
  #   WEBSOCKET_ENDPOINT = data.terraform_remote_state.websocket_api.outputs.websocket_api_endpoint
  #   ENVIRONMENT        = var.environment
  # }

  depends_on = [module.lambda_layer]

  tags = {
    Name = "${var.project_name}-lambda"
  }
}

module "lambda_layer" {
  source          = "terraform-aws-modules/lambda/aws"
  version         = "~> 4.7"
  create_function = false
  create_layer    = true

  layer_name          = "${var.project_name}-python-layer"
  description         = "${var.project_name} python layer"
  compatible_runtimes = ["python3.11"]
  runtime             = "python3.11"

  source_path = [
    {
      path             = "../lambda-layer"
      pip_requirements = true
      prefix_in_zip    = "python"
    }
  ]

  store_on_s3 = false

  tags = {
    Name = "${var.project_name}-layer"
  }
}