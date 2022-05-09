variable "instance-profile" {
  type        = string
  description = "EC2 IAM permission"
}

variable "nginx-sg" {
  type        = list(any)
  description = ""
}

variable "bastion-sg" {
  type        = list(any)
  description = ""
}

variable "webserver-sg" {
  type        = list(any)
  description = ""
}

variable "ami-bastion" {
  type        = string
  description = ""
}

variable "ami-nginx" {
  type        = string
  description = ""
}

variable "ami-web" {
  type        = string
  description = ""
}

variable "max_size" {
  type        = number
  description = ""
}

variable "min_size" {
  type        = number
  description = ""
}

variable "desired_capacity" {
  type        = number
  description = ""
}

variable "public_subnets" {
  type        = list(any)
  description = ""
}

variable "private_subnets" {
  type        = list(any)
  description = ""
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "keypair" {
  description = ""
}

variable "nginx-tgt" {
  type = string
  description = ""
}

variable "tooling-tgt" {
  type = string
  description = ""
}

variable "wordpress-tgt" {
  type = string
  description = ""
}