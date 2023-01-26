# GL Homework 9: Jenkins

## Requirements:
```
Terraform v1.3.6
```

Generate shared ssh key you are going to use with AWS and Azure cloud providers. Use `ssh-keygen` or similar tools for it [How to Use ssh-keygen to Generate a New SSH Key?](https://www.ssh.com/academy/ssh/keygen)

### AWS infrastructure with Terraform

Via AWS Console create a new IAM user and add the `AdministratorAccess` Managed Policy to your IAM user. After user is created save _Access Key ID_ and a _Secret Access Key_, these credentials give access to your AWS account.

For Terraform to be able to make changes in your AWS account, you will need to set the AWS credentials for the IAM user you created above as the environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`. For example, here is how you can do it in a Unix/Linux/macOS terminal:

```
$ export AWS_ACCESS_KEY_ID=(your access key id)
$ export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

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


