env = "dev"
#cidr_block = "10.0.0.0/16"

default_vpc_id = "vpc-0aa3bbef058e14256"

vpc = {
  main = {
    cidr_block        = "10.0.0.0/16"
    availability_zone = ["us-east-1a", "us-east-1b"]
    public_subnets    = {
      public = {
        name           = "public"
        cidr_block     = ["10.0.0.0/24", "10.0.1.0/24"]
        # availability_zone = ["us-east-1a", "us-east-1b"]
        internet_gw    = true
      }
    }

    private_subnets = {
      private = {
        name           = "private"
        cidr_block     = ["10.0.2.0/24", "10.0.3.0/24"]
        # availability_zone = ["us-east-1a", "us-east-1b"]
        nat_gw         = true
      }
    }
  }
}

docdb = {
  main = {
    vpc_name            = "main"
#    subnets_name        = "db"
   engine_version      = "4.0.0"
#    number_of_instances = 1
   instance_class      = "db.t3.medium"
  }
}

rds = {
  main = {
    vpc_name            = "main"
    #    subnets_name        = "db"
    engine_version      = "5.7.mysql_aurora.2.11.2"
    engine = "aurora-mysql"
    #    number_of_instances = 1
    instance_class      = "db.t3.small"
  }
}

