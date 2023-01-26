resource "aws_vpc" "jenkins-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"

  tags = {
    Name = "jenkins-vpc"
  }
}

resource "aws_subnet" "jenkins-subnet" {
  vpc_id                  = aws_vpc.jenkins-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "jenkins-subnet"
  }
}

resource "aws_internet_gateway" "jenkins-igw" {
  vpc_id = aws_vpc.jenkins-vpc.id
  tags = {
    Name = "jenkins-igw"
  }
}

resource "aws_route_table" "jenkins-rtble" {
  vpc_id = aws_vpc.jenkins-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jenkins-igw.id
  }

  tags = {
    Name = "jenkins-rtble"
  }
}

resource "aws_route_table_association" "jenkins-rta" {
  subnet_id      = aws_subnet.jenkins-subnet.id
  route_table_id = aws_route_table.jenkins-rtble.id
}

resource "aws_security_group" "jenkins-sg" {
  name   = "jenkins-sg"
  vpc_id = aws_vpc.jenkins-vpc.id
}

resource "aws_security_group_rule" "sg-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${chomp(data.http.myip.response_body)}/32"]
  security_group_id = aws_security_group.jenkins-sg.id
}

resource "aws_security_group_rule" "sg-http" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jenkins-sg.id
}

resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jenkins-sg.id
}
