provider "aws" {
  region = "us-east-2"
}

locals {
  environment        = "test"
  label_order        = ["name", "environment"]
  availability_zones = ["us-east-2a", "us-east-2b"]
}

module "vpc" {
  source      = "cypik/vpc/aws"
  version     = "1.0.2"
  name        = "vpc"
  environment = local.environment
  label_order = local.label_order
  cidr_block  = "172.16.0.0/16"
}

module "subnets" {
  source             = "cypik/subnet/aws"
  version            = "v1.0.3"
  name               = "subnet"
  environment        = local.environment
  label_order        = local.label_order
  availability_zones = local.availability_zones
  vpc_id             = module.vpc.vpc_id
  cidr_block         = module.vpc.vpc_cidr_block
  type               = "public"
  igw_id             = module.vpc.igw_id
  ipv6_cidr_block    = module.vpc.ipv6_cidr_block
}

module "efs" {
  source                    = "./.."
  name                      = "efs"
  environment               = "test"
  creation_token            = "changeme"
  availability_zones        = local.availability_zones
  vpc_id                    = module.vpc.vpc_id
  subnet_ids                = module.subnets.public_subnet_id
  security_groups           = [module.vpc.vpc_default_security_group_id]
  efs_backup_policy_enabled = true
  allow_cidr                = [module.vpc.vpc_cidr_block]
  replication_enabled       = true
  replication_configuration_destination = {
    region                 = "eu-west-2"
    availability_zone_name = ["eu-west-2a", "eu-west-2b"]
  }
}