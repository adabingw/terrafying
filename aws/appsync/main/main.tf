resource "aws_appsync_graphql_api" "appsync_graphql_api" {
  authentication_type = var.authentication_type
  name                = var.appsync_name
  schema              = var.schema
}

# for each this
resource "aws_appsync_api_key" "appsync_api_key" {
  api_id  = aws_appsync_graphql_api.appsync_graphql_api.id
  # expires = "2018-05-03T04:00:00Z"
}

# for each this
data "aws_iam_policy_document" "appsync_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["appsync.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "appsync_iam_role" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "appsync_iam_policy_document" {
  statement {
    effect    = "Allow"
    actions   = var.appsync_resource_actions
    resources = [
        var.appsync_resource_arn
    ]
  }
}

resource "aws_iam_role_policy" "appsync_iam_role_policy" {
  name   = var.appsync_iam_role_policy
  role   = aws_iam_role.appsync_iam_role.id
  policy = data.aws_iam_policy_document.appsync_assume_role.json
}

resource "aws_appsync_datasource" "this" {
  for_each = var.datasources

  api_id           = aws_appsync_graphql_api.appsync_graphql_api.id
  name             = each.key
  type             = each.value.type
  description      = lookup(each.value, "description", null)
  service_role_arn = aws_iam_role.appsync_iam_role.arn

  dynamic "http_config" {
    for_each = each.value.type == "HTTP" ? [true] : []

    content {
      endpoint = each.value.endpoint
    }
  }

  dynamic "lambda_config" {
    for_each = each.value.type == "AWS_LAMBDA" ? [true] : []

    content {
      function_arn = each.value.function_arn
    }
  }

  dynamic "dynamodb_config" {
    for_each = each.value.type == "AMAZON_DYNAMODB" ? [true] : []

    content {
      table_name             = each.value.table_name
      region                 = lookup(each.value, "region", null)
      use_caller_credentials = lookup(each.value, "use_caller_credentials", null)
    }
  }

  dynamic "elasticsearch_config" {
    for_each = each.value.type == "AMAZON_ELASTICSEARCH" ? [true] : []

    content {
      endpoint = each.value.endpoint
      region   = lookup(each.value, "region", null)
    }
  }

  dynamic "opensearchservice_config" {
    for_each = each.value.type == "AMAZON_OPENSEARCH_SERVICE" ? [true] : []

    content {
      endpoint = each.value.endpoint
      region   = lookup(each.value, "region", null)
    }
  }

  dynamic "event_bridge_config" {
    for_each = each.value.type == "AMAZON_EVENTBRIDGE" ? [true] : []

    content {
      event_bus_arn = each.value.event_bus_arn
    }
  }

  dynamic "relational_database_config" {
    for_each = each.value.type == "RELATIONAL_DATABASE" ? [true] : []

    content {
      source_type = lookup(each.value, "source_type", "RDS_HTTP_ENDPOINT")

      http_endpoint_config {
        db_cluster_identifier = each.value.cluster_arn
        aws_secret_store_arn  = each.value.secret_arn
        database_name         = lookup(each.value, "database_name", null)
        region                = split(":", each.value.cluster_arn)[3]
        schema                = lookup(each.value, "schema", null)
      }
    }
  }
}
