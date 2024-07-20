module "pov_lambda" {
    source = "../../../aws/lambda/main"
    filename = "app.zip"
    function_name = "pov_lambda"
    handler = "app.lambda_handler"
    runtime = "python3.12"
}
