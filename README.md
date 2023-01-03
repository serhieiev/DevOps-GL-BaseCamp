# GL Homework 6

## Requirements:
```
Terraform v1.3.6
"azure-cli": "2.43.0"
```

Generate shared ssh key you are going to use with AWS and Azure cloud providers. Use `ssh-keygen` or similar tools for it [How to Use ssh-keygen to Generate a New SSH Key?](https://www.ssh.com/academy/ssh/keygen)

### AWS

Via AWS Console create a new IAM user and add the `AdministratorAccess` Managed Policy to your IAM user. After user is created save _Access Key ID_ and a _Secret Access Key_, these credentials give access to your AWS account.

For Terraform to be able to make changes in your AWS account, you will need to set the AWS credentials for the IAM user you created above as the environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`. For example, here is how you can do it in a Unix/Linux/macOS terminal:

```
$ export AWS_ACCESS_KEY_ID=(your access key id)
$ export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

### MS Azure

Install and configure MS Azure CLI  according to the
instructions at [How to install the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli).

After that, you need to authenticate with Microsoft Azure using `az login` as described at [Sign in with Azure CLI](https://docs.microsoft.com/en-us/cli/azure/authenticate-azure-cli).

## Deployment
To deploy modules, copy the `terraform.tfvars.example` using the following command:

```
cp terraform.tfvars.example terraform.tfvars
```

And then edit `terraform.tfvars` as appropriate for your configurations.

Execute the following commands in the root directory:
```
terraform init
terraform apply
```

Review `Outputs:` section abd visit `aws_ip` and `az_ip`

## My Results:
```
Apply complete! Resources: 19 added, 0 changed, 0 destroyed.

Outputs:

aws_ip = "54.198.153.254"
aws_ssh_connection_string = "ssh -i ~/.ssh/id_rsa ubuntu@54.198.153.254"
az_ip = "52.143.60.208"
az_ssh_connection_string = "ssh -i ~/.ssh/id_rsa ubuntu@52.143.60.208"
```

Grafana server AWS API: `54.198.153.254`

Grafana server Azure IP: `52.143.60.208`
