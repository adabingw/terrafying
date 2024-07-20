resource "aws_api_gateway_integration" "api_gateway_integration" {
  rest_api_id          = var.rest_api_id
  resource_id          = var.resource_id
  http_method          = var.http_method
  type                 = var.integration_type
  cache_key_parameters = var.cache_key_parameters
  cache_namespace      = var.cache_namespace
  timeout_milliseconds = var.timeout_milliseconds

  request_parameters = var.request_parameters

  # Transforms the incoming XML request to JSON
  request_templates = var.request_templates
  uri               = var.integration_uri
}
