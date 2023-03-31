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

#module "DOCDB" {
#  source = "github.com/Dimpulsunayana/docdb_tf"
#
#  env = var.env
#  for_each = var.docdb
#  subnet_ids          = lookup(lookup(lookup(lookup(module.vpc, each.value.vpc_name, null), "private_subnet_ids", null), each.value.subnets_name, null), "subnet_ids", null)
#  main_vpc = lookup(lookup(module.vpc, "main",null ),"main_vpc" , null)
#  allow_cidr = lookup(lookup(lookup(lookup(var.vpc, each.value.vpc_name, null), "private_subnets", null), "private", null), "cidr_block", null)
#}