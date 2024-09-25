resource "aws_vpc" "test" {
  cidr_block = var.cidr_block

  tags = {
    Name = "${var.name}-vpc"
  }
}

resource "aws_subnet" "test" {
  vpc_id            = aws_vpc.test.id
  cidr_block        = var.subnet_cidr_block
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-subnet"
  }
}

resource "aws_internet_gateway" "test" {
  vpc_id = aws_vpc.test.id

  tags = {
    Name = "${var.name}-igw"
  }
}

resource "aws_route_table" "test" {
  vpc_id = aws_vpc.test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test.id
  }

  tags = {
    Name = "${var.name}-route-table"
  }
}

resource "aws_route_table_association" "test" {
  subnet_id      = aws_subnet.test.id
  route_table_id = aws_route_table.test.id
}
