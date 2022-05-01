variable "account_no" {
  type        = number
  description = ""
}

variable "efs-subnet-1" {
  description = ""
}

variable "efs-subnet-2" {
  description = ""
}

variable "efs-sg" {
  type        = list(any)
  description = ""
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}
