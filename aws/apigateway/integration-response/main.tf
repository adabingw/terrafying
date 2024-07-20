resource "aws_api_gateway_integration_response" "api_gateway_integration_response" {
  rest_api_id          = var.rest_api_id
  resource_id          = var.resource_id
  http_method          = var.http_method
  status_code          = var.status_code

  # Transforms the backend JSON response to XML
  response_templates = var.response_templates
}
