variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to run"
  type        = string
}

variable "subnet_id" {
  description = "value"
}

variable "name" {
  description = "The name of the EC2 instance"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID to which the EC2 instance will be associated"
  type        = string
}

variable "allow_ssh" {
  description = "Whether to allow SSH access"
  type        = bool
  default     = true
}

variable "ssh_cidr" {
  description = "The CIDR block to allow SSH access"
  type        = string
  default     = "0.0.0.0/0"  # Change this for more secure access
}

variable "allow_http" {
  description = "Whether to allow HTTP access"
  type        = bool
  default     = true
}
