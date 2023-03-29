module "vpc" {
  source = "github.com/Dimpulsunayana/tf-vpc-subnets"

  env =var.env
  cidr_block = var.cidr_block
  default_vpc_id = var.default_vpc_id
}