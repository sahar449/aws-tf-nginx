resource "aws_instance" "test" {
  ami           = var.ami
  instance_type = var.instance_type
  user_data = <<-EOF
              #!/bin/bash
              # Update package index
              apt-get update
              # Install Nginx
              apt-get install -y nginx
              # Start Nginx service
              systemctl start nginx
              # Enable Nginx to start on boot
              systemctl enable nginx
              EOF
  subnet_id = var.subnet_id
  security_groups = [ aws_security_group.test.id ]
  tags = {
    Name = var.name
  }
}

resource "aws_security_group" "test" {
  vpc_id = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${data.http.myip.response_body}/32"] # Add only my public ip
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  tags = {
    Name = "${var.name}-sg"
  }
}
