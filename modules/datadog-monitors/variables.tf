variable "monitor_definitions" {
  type = map(object({
    name      = string
    query     = string
    message   = string
    tags      = list(string)
    threshold = number
  }))
}

variable "account_number" {
  description = "AWS account number for the environment"
  type        = string
}

variable "account_alias" {
  description = "Human-readable alias for the AWS account"
  type        = string
}
