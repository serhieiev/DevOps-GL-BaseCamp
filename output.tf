# AWS Outputs
output "aws_ip" {
  description = "The public IP address of the AWS virtual machine"
  value       = module.aws.ip
}

output "aws_ssh_connection_string" {
  description = "The SSH command to connect to the AWS virtual machine"
  value       = module.aws.ssh_connection_string
}
