variable "appsync_name" {
    type = string
}

variable "schema" {
  description = "The schema definition, in GraphQL schema language format. Terraform cannot perform drift detection of this configuration."
  type        = string
}

variable "authentication_type" {
  description = "The authentication type to use by GraphQL API"
  type        = string
  default     = "API_KEY"
}

variable "dynamodb_allowed_actions" {
  description = "List of allowed IAM actions for datasources type AMAZON_DYNAMODB"
  type        = list(string)
  default     = ["dynamodb:GetItem", "dynamodb:PutItem", "dynamodb:DeleteItem", "dynamodb:UpdateItem", "dynamodb:Query", "dynamodb:Scan", "dynamodb:BatchGetItem", "dynamodb:BatchWriteItem"]
}

variable "role_name" {
    type = string
}

variable "appsync_resource_actions" {
    type = list(string)
}

variable "appsync_resource_arn" {
    type = string
}

variable "appsync_iam_role_policy" {
    type = string
}

variable "appsync_datasource_name" {
    type = string
}

variable "appsync_datasource_type" {
    type = string
}

variable "appsync_resource_name" {
    type = string
}

variable "region" {
    type = string
}
