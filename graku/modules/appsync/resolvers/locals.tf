locals {
    appsync = [
        {
            query_type = "MUTATION"
            resolver_field = ""
            appsync_datasource_name = ""
            code = code("resolvers/...")
        }
    ]
}
