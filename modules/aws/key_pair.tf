resource "aws_key_pair" "jenkins" {
  key_name   = "jenkins"
  public_key = file(var.ssh_pub_key_file)
}
