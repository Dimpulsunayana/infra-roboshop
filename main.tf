module "vpc" {
  source = "github.com/Dimpulsunayana/tf-vpc-subnets"

  env =var.env
 #cidr_block = var.cidr_block
  default_vpc_id = var.default_vpc_id

  for_each = var.vpc
 public_subnets = each.value.public_subnets
  private_subnets = each.value.private_subnets
  availability_zone = each.value.availability_zone
  cidr_block = each.value.cidr_block
  #name = each.value.name
}

output "vpc" {
  value = module.vpc
}

module "DOCDB" {
  source = "github.com/Dimpulsunayana/docdb_tf"

  env = var.env
  for_each = var.docdb
  subnet_ids          = lookup(lookup(lookup(lookup(module.vpc, each.value.vpc_name, null),  "private_subnets", null), "private", null), "subnet_ids", null)
  main_vpc = lookup(lookup(module.vpc, "main",null ),"main_vpc" , null)
  allow_cidr = lookup(lookup(lookup(lookup(var.vpc, each.value.vpc_name, null), "private_subnets", null), "app", null), "cidr_block", null)
  instance_class = each.value.instance_class
  engine_version = each.value.engine_version
}

module "rds" {
  source = "github.com/Dimpulsunayana/rds_tf"
  env = var.env
  subnet_ids          = lookup(lookup(lookup(lookup(module.vpc, each.value.vpc_name, null), "private_subnets", null), "private", null), "subnet_ids", null)
  allow_cidr = lookup(lookup(lookup(lookup(var.vpc, each.value.vpc_name, null), "private_subnets", null), "app", null), "cidr_block", null)
  main_vpc = lookup(lookup(module.vpc, "main",null ),"main_vpc" , null)

  for_each = var.rds
  instance_class = each.value.instance_class
  engine_version = each.value.engine_version
  engine = each.value.engine


}

#output "rs" {
#  value = module.rds
#}

module "elasticache" {
  source = "github.com/Dimpulsunayana/elasticache_tf"
  env = var.env
  subnet_ids          = lookup(lookup(lookup(lookup(module.vpc, each.value.vpc_name, null), "private_subnets", null), "private", null), "subnet_ids", null)
  allow_cidr = lookup(lookup(lookup(lookup(var.vpc, each.value.vpc_name, null), "private_subnets", null), "app", null), "cidr_block", null)
  main_vpc = lookup(lookup(module.vpc, "main",null ),"main_vpc" , null)

  for_each = var.redis
  node_type = each.value.node_type
  #engine_version = each.value.engine_version
  //vpc_name = each.value.vpc_name
}

module "rabbitmq" {
  source = "github.com/Dimpulsunayana/rabbitmq-tf"
  env = var.env
  subnet_ids          = lookup(lookup(lookup(lookup(module.vpc, each.value.vpc_name, null), "private_subnets", null), "private", null), "subnet_ids", null)
  allow_cidr = lookup(lookup(lookup(lookup(var.vpc, each.value.vpc_name, null), "private_subnets", null), "app", null), "cidr_block", null)
  main_vpc = lookup(lookup(module.vpc, "main",null ),"main_vpc" , null)

  for_each = var.rabbitmq
  engine_type = each.value.engine_type
  engine_version = each.value.engine_version
  host_instance_type = each.value.host_instance_type
  deployment_mode = each.value.deployment_mode
}

#module "alb-tf" {
#  source = "github.com/Dimpulsunayana/alb-tf"
#  env = var.env
#
#  for_each     = var.alb
#   subnet_ids   = lookup(lookup(lookup(lookup(module.vpc, each.value.vpc_name, null), each.value.subnets_type, null), each.value.subnets_name, null), "subnet_ids", null)
#  main_vpc       = lookup(lookup(module.vpc, each.value.vpc_name, null), "main_vpc", null)
#  //subnet_ids          = lookup(lookup(lookup(lookup(module.vpc, each.value.vpc_name, null), each.value.subnets_type, null), each.value.subnets_name, null), "subnet_ids", null)
#  allow_cidr = lookup(lookup(lookup(lookup(var.vpc, each.value.vpc_name, null), "private_subnets", null), "app", null), "cidr_block", null)
#  //main_vpc = lookup(lookup(module.vpc, "main",null ),"main_vpc" , null)
#  #subnets_name = each.value.subnets_name
#}