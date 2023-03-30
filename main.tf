module "vpc" {
  source = "github.com/Dimpulsunayana/tf-vpc-subnets"

  env =var.env
  cidr_block = var.cidr_block
  default_vpc_id = var.default_vpc_id

  for_each = var.subnets
  availability_zone = each.value.availability_zone
  cidr_block = each.value.cidr_block
}