variable "region" {
  default = "us-east-1"
}

variable "app_name" {
  default = "fastapi-bedrock"
}

variable "vpc_id" {}
variable "public_subnets" {
  type = list(string)
}

variable "dynamodb_table_arn" {}