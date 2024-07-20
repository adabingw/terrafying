resource "aws_api_gateway_resource" "api_gateway_resource" {
  rest_api_id = var.api_id
  parent_id   = var.parent_id
  path_part   = var.path
}
