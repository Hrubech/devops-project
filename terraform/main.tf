data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

locals {
  ami_id        = data.aws_ami.ubuntu.id
  filename      = "./keypair/${var.stack}.pem"
  instance_name = var.stack
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = "project_vpc"
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id
}

module "keypair" {
  source   = "./modules/keypair"
  key_name = var.stack
  filename = local.filename
}

module "security_groups" {
  source                = "./modules/security_group"
  vpc_id                = module.vpc.vpc_id
  security_groups_name  = var.security_groups_name
  security_groups_ports = var.security_groups_ports
  protocol              = var.protocol
  depends_on            = [module.keypair]
}

module "ec2_docker" {
  source           = "./modules/docker"
  ami              = local.ami_id
  key_name         = var.stack
  private_key_path = local.filename
  username         = var.username
  # security_groups_name = module.security_groups.sg_name
  security_groups_name = var.security_groups_name
  security_group_id = var.security_group_id
  subnet_id            = module.subnets.public_subnet_1_id
  instance_name        = local.instance_name
  instance_type        = var.instance_type
  count                = var.stack == "docker" ? 1 : 0
  depends_on           = [module.keypair]
}

module "ec2_kubernetes" {
  source           = "./modules/kubernetes"
  ami              = local.ami_id
  key_name         = var.stack
  private_key_path = local.filename
  username         = var.username
  subnet_id        = module.subnets.public_subnet_2_id
  # security_groups_name = module.security_groups.sg_name
  security_groups_name = var.security_groups_name
  security_group_id = var.security_group_id
  instance_name        = local.instance_name
  instance_type        = var.instance_type
  count                = var.stack == "kubernetes" ? 1 : 0
  depends_on           = [module.keypair]
}