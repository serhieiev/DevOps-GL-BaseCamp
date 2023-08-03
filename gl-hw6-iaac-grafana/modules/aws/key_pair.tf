resource "aws_key_pair" "graf" {
  key_name   = "graf"
  public_key = file(var.ssh_pub_key_file)
}
