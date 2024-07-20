module "pov_lambda_permission" {
    source = "../../../aws/lambda/permissions"
    function_name = "pov_lambda"
    region = var.region
    account_id = var.account_id
    api_id = var.api_id
    http_method = var.http_method
    resource_path = var.resource_path
}
