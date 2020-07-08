variable "environment" {
  type          = string
  description   = "Environment abbreviation (poc|dev|sit|qa|uat|cust)"
}

variable "client" {
  type          = string
  description   = "The client product using this service"
}

variable "service" {
  type          = string
  description   = "The service name for the producer"
}

variable "tag_finance" {
  type          = string
}

variable "aws_region" {
  type          = string
  description   = "Region"
}

variable "state_bucket" {
  type          = string
  description   = "name of the S3 bucket where state is stored"
}

variable "state_region" {
  type          = string
  description   = "AWS region where state bucket is located"
}

variable "remote_state_key" {
  type          = string
  description   = "S3 object key for the remote state object"
}


