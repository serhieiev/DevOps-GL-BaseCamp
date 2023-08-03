resource "aws_instance" "vm_instance" {
  ami                    = var.aws_ami
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.graf.key_name
  vpc_security_group_ids = [aws_security_group.graf-sg.id]
  subnet_id              = aws_subnet.graf-subnet.id
  user_data              = file("${path.module}/install_grafana.sh")

  tags = {
    Name = "graf"
  }
}
