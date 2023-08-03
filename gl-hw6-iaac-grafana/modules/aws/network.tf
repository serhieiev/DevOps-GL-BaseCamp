resource "aws_vpc" "graf-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"

  tags = {
    Name = "graf-vpc"
  }
}

resource "aws_subnet" "graf-subnet" {
  vpc_id                  = aws_vpc.graf-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "graf-subnet"
  }
}

resource "aws_internet_gateway" "graf-igw" {
  vpc_id = aws_vpc.graf-vpc.id
  tags = {
    Name = "graf-igw"
  }
}

resource "aws_route_table" "graf-rtble" {
  vpc_id = aws_vpc.graf-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.graf-igw.id
  }

  tags = {
    Name = "graf-rtble"
  }
}

resource "aws_route_table_association" "graf-rta" {
  subnet_id      = aws_subnet.graf-subnet.id
  route_table_id = aws_route_table.graf-rtble.id
}

resource "aws_security_group" "graf-sg" {
  name   = "graf-sg"
  vpc_id = aws_vpc.graf-vpc.id
}

resource "aws_security_group_rule" "sg-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${chomp(data.http.myip.response_body)}/32"]
  security_group_id = aws_security_group.graf-sg.id
}

resource "aws_security_group_rule" "sg-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.graf-sg.id
}

resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.graf-sg.id
}
