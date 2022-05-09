region = "us-east-1"

vpc_cidr = "10.0.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

enable_classiclink = "false"

enable_classiclink_dns_support = "false"

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

environment = "dev"
max_subnets = 20

name = "project19"

tags = {
  Enviroment      = "production"
  Owner-Email     = "somex@tech.io"
  Managed-By      = "Terraform"
  Billing-Account = "1234567890"
}

ami-web = "ami-0080dd082e6ea0e1d"

ami-bastion = "ami-078271667e170f1ce"

ami-nginx = "ami-0da4e6e3b12052ac6"

ami-sonar = "ami-03889bbeff2c817d8"

keypair = "project1"


account_no = "704771385539"

master-username = "somex"

master-password = "password123"

tags = {
  Enviroment      = "production"
  Owner-Email     = "somex@tech.io"
  Managed-By      = "Terraform"
  Billing-Account = "1234567890"
}