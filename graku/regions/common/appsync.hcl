dependency "dynamodb" {
    config_path = find_in_parent_folders("zones/us-east-1/dynamodb")
}

inputs = {
    graku_dynamo_arn = dependency.dynamodb.outputs.graku_dynamo_table_arn
    graku_dynamo_name = dependency.dynamodb.outputs.graku_dynamo_table_name
}

terraform {
    source = find_in_parent_folders("modules/appsync/main")
}
