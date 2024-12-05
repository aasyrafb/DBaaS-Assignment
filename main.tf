provider "aws" {
  region = "ap-southeast-1" # Update this to your desired AWS region
}

terraform {
  backend "s3" {
    bucket         = "sctp-ce8-tfstate"  # Replace with your bucket name
    key            = "asyraf-terraform.tfstate"    # Path to store tfstate
    region         = "ap-southeast-1"           # Region of the S3 bucket
  }
}

resource "aws_dynamodb_table" "books_table" {
  name           = "asyraf-bookinventory-assignment"  # Replace with your table name
  billing_mode   = "PAY_PER_REQUEST"

  attribute {
    name = "ISBN"
    type = "S"
  }

  attribute {
    name = "Genre"
    type = "S"
  }

  hash_key = "ISBN"

  global_secondary_index {
    name            = "GenreIndex"
    hash_key        = "Genre"
    projection_type = "ALL"
  }

  tags = {
    Project     = "Asyraf-DynamoDB-Terraform"
  }
}