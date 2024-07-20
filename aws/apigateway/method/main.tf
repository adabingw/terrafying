resource "aws_api_gateway_method" "api_gateway_method" {
  rest_api_id   = var.rest_api_id
  resource_id   = var.resource_id
  http_method   = var.http_method
  authorization = var.authorization
}

resource "aws_api_gateway_method_response" "api_gateway_method_response" {
  rest_api_id = var.rest_api_id
  resource_id = var.resource_id
  http_method = aws_api_gateway_method.api_gateway_method.http_method
  status_code = "200"
}
