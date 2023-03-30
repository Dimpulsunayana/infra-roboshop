module "vpc" {
  source = "github.com/Dimpulsunayana/tf-vpc-subnets"

  env =var.env
  #cidr_block = var.cidr_block
  default_vpc_id = var.default_vpc_id

  for_each = var.subnets
#  public_subnets = each.value.public_subnets
#  private_subnets = each.value.private_subnets
  availability_zone = each.value.availability_zone
  cidr_block = each.value.cidr_block
  name = each.value.name
}

variable "subnets" {
      public_subnets = {
        public = {
          name              = "public"
          cidr_block        = ["10.0.0.0/24", "10.0.1.0/24"]
          availability_zone = ["us-east1a", "us-east1b"]
        }
      }

      private_subnets = {
        private = {
          name              = "private"
          cidr_block        = ["10.0.2.0/24", "10.0.3.0/24"]
          availability_zone = ["us-east1a", "us-east1b"]
        }
      }
    }