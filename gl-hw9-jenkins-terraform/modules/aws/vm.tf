resource "aws_instance" "vm_instance" {
  ami                    = var.aws_ami
  instance_type          = "t2.medium"
  key_name               = aws_key_pair.jenkins.key_name
  vpc_security_group_ids = [aws_security_group.jenkins-sg.id]
  subnet_id              = aws_subnet.jenkins-subnet.id
  user_data              = file("${path.module}/install_docker_jenkins.sh")

  tags = {
    Name = "jenkins"
  }
}
