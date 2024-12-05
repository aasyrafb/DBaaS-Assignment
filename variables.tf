variable "aws_region" {
  default = "ap-southeast-1"
}

variable "s3_bucket" {
  description = "sctp-ce8-tfstate"
}

variable "dynamodb_table_name" {
  default = "asyraf-bookinventory-assignment"
}

