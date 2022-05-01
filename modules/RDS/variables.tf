variable "private_subnets" {
  description = ""
}

variable "master-username" {
  description = ""
}

variable "master-password" {
  description = ""
}

variable "rds-sg" {
  type        = list(any)
  description = ""
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}