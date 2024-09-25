provider "aws" {
  region = "us-west-2"  # Change this to your desired region
}

terraform {
  required_version = "~> 1.5" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 2.0"
    }
  }
}

module "vpc" {
  source             = "./modules/vpc"
  cidr_block         = "10.0.0.0/16"
  subnet_cidr_block  = "10.0.1.0/24"
  availability_zone  = "us-west-2a"
  name               = "Sahar-vpc"
}

module "ec2" {
  source        = "./modules/ec2"
  ami           = "ami-05134c8ef96964280" #ubuntu
  instance_type = "t3.micro"
  name          = "nginx"
  subnet_id     = module.vpc.subnet_id
  vpc_id = module.vpc.vpc_id
}

resource "null_resource" "test_ec2" {
  provisioner "local-exec" {
    command = "sleep 30 & telnet ${module.ec2.public_ip} 80"
  }

  depends_on = [module.ec2]
}

