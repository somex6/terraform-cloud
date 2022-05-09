# vpc module
module "VPC" {
  source                              = "./modules/VPC"
  region                              = var.region
  vpc_cidr                            = var.vpc_cidr
  enable_dns_support                  = var.enable_dns_support
  enable_dns_hostnames                = var.enable_dns_hostnames
  enable_classiclink                  = var.enable_classiclink
  enable_classiclink_dns_support      = var.enable_classiclink_dns_support
  preferred_number_of_private_subnets = var.preferred_number_of_private_subnets
  preferred_number_of_public_subnets  = var.preferred_number_of_public_subnets
  max_subnets = var.max_subnets
  private_subnets                     = [for i in range(1, 8, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
  public_subnets                      = [for i in range(2, 5, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
}

module "ALB" {
  source             = "./modules/ALB"
  ext_alb = "ext-alb"
  int_alb = "ialb"
  vpc_id             = module.VPC.vpc_id
  ext-alb-sg         = module.security.EXT-ALB-sg
  int-alb-sg         = module.security.INT-ALB-sg
  public-sbn-1       = module.VPC.public_subnet-1
  public-sbn-2       = module.VPC.public_subnet-2
  private-sbn-1      = module.VPC.private_subnet-1
  private-sbn-2      = module.VPC.private_subnet-2
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  alb_dns_name       = module.ALB.alb_dns_name
  tooling-tgt = module.ALB.tooling-tgt
  nginx-tgt         = module.ALB.nginx-tgt
  wordpress-tgt     = module.ALB.wordpress-tgt
}

module "security" {
  source = "./modules/security"
  vpc_id = module.VPC.vpc_id
}

module "AutoScaling" {
  source           = "./modules/Autoscaling"
  ami-bastion      = var.ami
  ami-nginx        = var.ami
  ami-webserver    = var.ami
  max_size         = 2
  min_size         = 2
  desired_capacity = 2
  instance-profile = module.VPC.instance-profile
  nginx-sg         = [module.security.nginx-sg]
  webserver-sg     = [module.security.webserver-sg]
  bastion-sg       = [module.security.bastion-sg]  
  public_subnets  = [module.VPC.public_subnet-1, module.VPC.public_subnet-2]
  private_subnets = [module.VPC.private_subnet-1, module.VPC.private_subnet-2]
  keypair         = var.keypair
  nginx-tgt = module.ALB.nginx-tgt
  wordpress-tgt = module.ALB.wordpress-tgt
  tooling-tgt = module.ALB.tooling-tgt
}

module "EFS" {
  source       = "./modules/EFS"
  efs-subnet-1 = module.VPC.private_subnet-1
  efs-subnet-2 = module.VPC.private_subnet-2
  efs-sg       = [module.security.datalayer-sg]
  account_no   = var.account_no
}


module "RDS" {
  source          = "./modules/RDS"
  rds-sg          = [module.security.datalayer-sg]
  master-username = var.master-username
  master-password = var.master-password
  private_subnets = [module.VPC.private_subnet-3, module.VPC.private_subnet-4]
}

# The Module creates instances for jenkins, sonarqube abd jfrog
module "compute" {
  source          = "./modules/compute"
  ami-jenkins     = var.ami
  ami-sonar       = var.ami
  ami-jfrog       = var.ami
  subnets-compute = module.VPC.public_subnet-1
  sg-compute      = [module.security.EXT-ALB-sg]
  keypair         = var.keypair
}







# resource "aws_instance" "web" {
#   ami           = lookup(var.images, var.region, "ami-12323")
#   instance_type = "t2.micro"
# }







# resource "aws_db_instance" "read_replica" {
#   count               = var.create_read_replica == true ? var.create_read_replica : 0
#   replicate_source_db = aws_db_instance.read_replica.id
#   availability_zone = random_shuffle.az_list.result[count.index]
# }