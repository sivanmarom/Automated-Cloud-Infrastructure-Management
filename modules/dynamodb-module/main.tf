provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "dynamo-table" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = var.user_col

  attribute {
    name = var.user_col
    type = "S"
  }
  attribute {
    name = var.timestamp_col
    type = "S"
  }
  attribute {
    name = var.message_col
    type = "S"
  }
  global_secondary_index {
    name            = "GSI"
    hash_key        = var.timestamp_col
    projection_type = "ALL"
  }

  global_secondary_index {
    name            = "GSI2"
    hash_key        = var.message_col
    projection_type = "ALL"
  }
  tags = {
    Name = var.user_col
  }
}
