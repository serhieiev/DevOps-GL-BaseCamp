module "aws" {
  source            = "./modules/aws"
  aws_region        = var.aws_region
  aws_ami           = var.aws_ami
  ssh_pub_key_file  = var.ssh_pub_key_file
  ssh_priv_key_file = var.ssh_priv_key_file
}

