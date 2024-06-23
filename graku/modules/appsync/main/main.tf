module "graku_appsync" {
    source = "../../../../aws/appsync/main"

    appsync_name = "graku_appsync"
    schema = file("../schema.graphql")
    authentication_type = "API_KEY"
    
    role_name = "graku_appsync_role"
    appsync_resource_actions = [
        "dynamodb:GetItem", 
        "dynamodb:PutItem", 
        "dynamodb:DeleteItem", 
        "dynamodb:UpdateItem", 
        "dynamodb:Query", 
        "dynamodb:Scan", 
        "dynamodb:BatchGetItem", 
        "dynamodb:BatchWriteItem"
    ]
    appsync_resource_arn = var.graku_dynamo_arn
    appsync_resource_name = var.graku_dynamo_name

    appsync_datasource_name = "graku_appsync_dynamo"
    appsync_datasource_type = "AMAZON_DYNAMODB"

    appsync_iam_role_policy = "graku_appsync_role_policy"

    region = "us-east-1"

    datasources = {
        "graku_dynamodb" = {
            type = "AMAZON_DYNAMODB",
            table_name = "graku_dynamo",
            region = "us-east-1"
        }
    }
}
