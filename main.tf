terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "dev" {
  source = "./moudules"
  aws_vpc_cidr = "10.0.0.0/16"
  aws_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  aws_subnet_az = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  aws_ami = "ami-00952f27cf14db9cd"
  aws_instance_type = "t2.micro"
  
}

