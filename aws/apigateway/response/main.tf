resource "aws_api_gateway_gateway_response" "api_gateway_gateway_response" {
  rest_api_id   = var.rest_api_id
  status_code   = var.status_code
  response_type = var.response_type

  response_templates = var.response_templates
  response_parameters = var.response_parameters
}
