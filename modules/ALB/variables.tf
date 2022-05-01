variable "ext-alb-sg" {
  type        = string
  description = "The security group for the external load balancer"
}

variable "public-sbn-1" {
  description = "public subnet to deploy external load balancer"
}

variable "public-sbn-2" {
  description = "public subnet to deploy external load balancer"
}

variable "ip_address_type" {
  type        = string
  description = "the type of ip address"
}

variable "load_balancer_type" {
  type        = string
  description = "The type of load balancer to be deployed"
}

variable "int-alb-sg" {
  description = "security group for the internal load balancer"
}

variable "private-sbn-1" {
  description = "private subnet to deploy internal load balancer"
}

variable "private-sbn-2" {
  description = "private subnet to deploy internal load balancer"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}

variable "alb_dns_name" {
  type        = string
  description = ""
}

variable "tooling-tgt" {
  type = string
  description = ""
}

variable "ext_alb" {
  type = string
  description = ""
}

variable "int_alb" {
  type = string
  description = ""
}

variable "nginx-tgt" {
  type = string
  description = ""
}

variable "wordpress-tgt" {
  type = string
  description = ""
}

