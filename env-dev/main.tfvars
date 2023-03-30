env = "dev"
cidr_block = "10.0.0.0/16"

default_vpc_id = "vpc-0aa3bbef058e14256"

subnets = {
    default = {
        public_subnets = {
            name              = "public"
            cidr_block        = ["10.0.0.0/24", "10.0.1.0/24"]
            availability_zone = ["us-east1a", "us-east1b"]
        }

        private_subnets = {
            name              = "private"
            cidr_block        = ["10.0.2.0/24", "10.0.3.0/24"]
            availability_zone = ["us-east1a", "us-east1b"]
        }
    }
}