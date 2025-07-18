# data "terraform_remote_state" "websocket_api" {
#   backend = "s3"
#   config = {
#     bucket = "example-aws-terraform-terraform-state"
#     key    = "example-aws-api-websocket/terraform.tfstate"
#     region = "us-east-1"
#   }
# }