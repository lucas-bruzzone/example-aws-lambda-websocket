# # Policy para WebSocket e DynamoDB
# resource "aws_iam_role_policy" "lambda_websocket_policy" {
#   name = "${var.project_name}-lambda-websocket-policy"
#   role = aws_iam_role.lambda.id

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "execute-api:PostToConnection",
#           "execute-api:ManageConnections"
#         ]
#         Resource = "${data.terraform_remote_state.websocket_api.outputs.websocket_api_execution_arn}/*"
#       },
#       {
#         Effect = "Allow"
#         Action = [
#           "dynamodb:PutItem",
#           "dynamodb:DeleteItem",
#           "dynamodb:GetItem",
#           "dynamodb:Query"
#         ]
#         Resource = data.terraform_remote_state.websocket_api.outputs.connections_table_arn
#       }
#     ]
#   })
# }