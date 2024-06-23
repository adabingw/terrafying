resource "aws_dynamodb_table" "dynamodb_table" {
  name           = var.table_name
  hash_key       = var.hash_key
  range_key      = var.range_key

  dynamic "attribute" {
    for_each = var.attributes 
    content {
        name = attribute.value.name
        type = attribute.value.type
    }
  }
}
