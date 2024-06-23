resource "aws_appsync_graphql_api" "appsync_graphql_api" {
  authentication_type = var.authentication_type
  name                = var.appsync_name
  schema              = var.schema
}

resource "aws_appsync_api_key" "appsync_api_key" {
  api_id  = aws_appsync_graphql_api.appsync_graphql_api.id
  # expires = "2018-05-03T04:00:00Z"
}

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

# deal with foreach later
resource "aws_appsync_datasource" "appsync_datasource" {
  api_id           = aws_appsync_graphql_api.appsync_graphql_api.id
  name             = var.appsync_datasource_name
  service_role_arn = aws_iam_role.appsync_iam_role.arn
  type             = var.appsync_datasource_type

  dynamodb_config {
    table_name = var.appsync_resource_name
    region = var.region
  }
}
