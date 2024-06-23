module "graku_appsync_resolver" {
    source = "../../../aws/appsync/resolvers"
    for_each = { for resolver in local.appsync : resolver.name => resolver }

    appsync_api_id = var.appsync_api_id

    query_type = each.value.query_type
    resolver_field = each.value.resolver_field
    appsync_datasource_name = each.value.appsync_datasource_name
    code = each.value.code
}
