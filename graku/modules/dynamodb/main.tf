module "graku_dynamo_table" {
    source = "../../../aws/dynamodb"
    table_name = "graku_dynamo"

    hash_key = "id"
    range_key = "type"

    attributes = [
        { name = "id", type = "S" },
        { name = "type", type = "S" },
        { name = "name", type = "S" },
        { name = "data", type = "M" }
    ]
}
