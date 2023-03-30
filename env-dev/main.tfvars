env = "dev"
#cidr_block = "10.0.0.0/16"

default_vpc_id = "vpc-0aa3bbef058e14256"

vpc = {
  main = {
    cidr_block = "10.0.0.0/16"
    availability_zone = ["us-east-1a", "us-east-1b"]
    public_subnets    = {
      public = {
        name              = "public"
        cidr_block        = ["10.0.0.0/24", "10.0.1.0/24"]
       # availability_zone = ["us-east-1a", "us-east-1b"]
        #internet_gw   = true
      }
    }

#    private_subnets = {
#      web = {
#        name              = "web"
#        cidr_block        = ["10.0.2.0/24", "10.0.3.0/24"]
#        availability_zone = ["us-east-1a", "us-east-1b"]
#        # nat_gw     = true
#      }
#    }
  }
}


#subnets = {
#  map = {
#    public_subnets = {
#      name              = "public"
#      cidr_block        = ["10.0.0.0/24", "10.0.1.0/24"]
#      availability_zone = ["us-east1a", "us-east1b"]
#    }
#
#    #        private_subnets = {
#    #            name              = "private"
#    #            cidr_block        = ["10.0.2.0/24", "10.0.3.0/24"]
#    #            availability_zone = ["us-east1a", "us-east1b"]
#    #        }
#  }
#}