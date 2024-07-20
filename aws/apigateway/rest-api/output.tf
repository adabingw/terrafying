output "api_gateway_api_id" {
    value = aws_api_gateway_rest_api.api_gateway_rest_api.id
}

output "api_gateway_root_resource_id" {
    value = aws_api_gateway_rest_api.api_gateway_rest_api.root_resource_id
}
