resource "aws_appsync_resolver" "appsync_resolver" {
  type   = var.query_type
  api_id = var.appsync_api_id
  field  = var.resolver_field
  kind   = "PIPELINE"
  data_source = var.appsync_datasource_name
  code   = var.code

  runtime {
    name            = "APPSYNC_JS"
    runtime_version = "1.0.0"
  }
}
