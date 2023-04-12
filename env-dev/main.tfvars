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
      app = {
        name           = "app"
        cidr_block     = ["10.0.2.0/24", "10.0.3.0/24"]
        # availability_zone = ["us-east-1a", "us-east-1b"]
        nat_gw         = true
      }
      web = {
        name           = "web"
        cidr_block     = ["10.0.4.0/24", "10.0.5.0/24"]
        # availability_zone = ["us-east-1a", "us-east-1b"]
        nat_gw         = true
      }
      db = {
        name           = "db"
        cidr_block     = ["10.0.6.0/24", "10.0.7.0/24"]
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
    subnets_name       = "db"
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
    subnets_name       = "db"
  }
}

redis = {
  main = {
    vpc_name            = "main"
    node_type = "cache.t3.micro"
    #engine_version = "6.x"
    subnets_name       = "db"
  }
}

rabbitmq = {
  main = {
    vpc_name            = "main"
    engine_type        = "RabbitMQ"
    engine_version     = "3.10.10"
    host_instance_type = "mq.t3.micro"
    deployment_mode = "SINGLE_INSTANCE"
    subnets_name       = "db"
  }
}

alb = {

  public = {
    vpc_name            = "main"
    subnets_type = "public_subnet_ids"
    subnets_name = "public"
  }

  private = {
    vpc_name            = "main"
    subnets_type = "private_subnet_ids"
    subnets_name = "app"
  }

}

