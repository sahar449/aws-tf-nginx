Terraform AWS Nginx ALB Module
This Terraform module deploys a high-availability Nginx setup on AWS, fronted by an Application Load Balancer (ALB).
Features

VPC with Internet Gateway
Multiple public subnets across different Availability Zones
EC2 instances running Nginx
Application Load Balancer for distributing traffic
Security groups for EC2 instances and ALB

Prerequisites

AWS account
Terraform 0.12+
AWS CLI configured with appropriate credentials

Usage
hclCopymodule "nginx_alb" {
  source = "github.com/your-username/terraform-aws-nginx-alb"

  name           = "my-nginx-setup"
  vpc_cidr_block = "10.0.0.0/16"
  instance_count = 2
  instance_type  = "t2.micro"
  region         = "us-west-2"
}
Inputs
NameDescriptionTypeDefaultRequirednamePrefix for naming resourcesstring"my-nginx"noregionAWS region to deploy resourcesstring"us-west-2"novpc_cidr_blockCIDR block for the VPCstring"10.0.0.0/16"noamiAMI ID for EC2 instancesstring"ami-xxxxxxxx"yesinstance_typeEC2 instance typestring"t2.micro"noinstance_countNumber of EC2 instances to createnumber2no
For a complete list of inputs, see the variables.tf file.
Outputs
NameDescriptionvpc_idThe ID of the VPCalb_dns_nameThe DNS name of the load balancerec2_public_ipsThe public IP addresses of the EC2 instances
For a complete list of outputs, see the outputs.tf file.
File Structure
Copyterraform-aws-nginx-alb/
│
├── main.tf         # Main Terraform configuration file
├── variables.tf    # Input variables
├── outputs.tf      # Output values
└── README.md       # This file
Contributing
Contributions are welcome! Please feel free to submit a Pull Request.
License
This project is licensed under the MIT License - see the LICENSE file for details.
