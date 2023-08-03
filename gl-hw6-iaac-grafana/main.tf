module "aws" {
  source            = "./modules/aws"
  aws_region        = var.aws_region
  aws_ami           = var.aws_ami
  ssh_pub_key_file  = var.ssh_pub_key_file
  ssh_priv_key_file = var.ssh_priv_key_file
}

module "azure" {
  source            = "./modules/azure"
  azure_location    = var.azure_location
  ssh_user          = var.ssh_user
  ssh_pub_key_file  = var.ssh_pub_key_file
  ssh_priv_key_file = var.ssh_priv_key_file
}

