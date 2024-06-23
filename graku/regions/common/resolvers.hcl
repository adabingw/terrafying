dependency "appsync" {
    config_path = find_in_parent_folders("zones/us-east-1/appsync/main")
}

inputs = {
    appsync_api_id = dependency.appsync.outputs.appsync_arn
}

terraform {
    source = find_in_parent_folders("modules/appsync/main")
}
