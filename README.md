# GL Homework 9: Jenkins

## Task
1. Setup Jenkins on server.
2. Create Multibranch pipeline and connect it with the Gitlab/Github project repository with the Jenkinsfile
3. Jenkinsfile should have several stages: build, tests, notification (telegram bot, etc.)
4. [Optional] Use branch conditions, vars, etc
5. [Optional] Create script for automated Jenkins setup (with user, plugins).


## Requirements:
```
Terraform >= v1.3.6
```

Generate shared ssh key you are going to use with AWS cloud. Use `ssh-keygen` or similar tools for it [How to Use ssh-keygen to Generate a New SSH Key?](https://www.ssh.com/academy/ssh/keygen)

### AWS infrastructure with Terraform

Via AWS Console create a new IAM user and add the `AdministratorAccess` Managed Policy to your IAM user. After user is created save _Access Key ID_ and a _Secret Access Key_, these credentials give access to your AWS account.

For Terraform to be able to make changes in your AWS account, you will need to set the AWS credentials for the IAM user you created above as the environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`. For example, here is how you can do it in a Unix/Linux/macOS terminal:

```
$ export AWS_ACCESS_KEY_ID=(your access key id)
$ export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

## Deployment
To deploy infrastructure, copy the `terraform.tfvars.example` using the following command:

```
cp terraform.tfvars.example terraform.tfvars
```

And then edit `terraform.tfvars` as appropriate for your configurations.

Execute the following commands in the root directory:
```
terraform init
terraform apply
```

- Pay attention to the `Outputs` and you will see the IP of you Jenkins instance and ssh connection string like on the example below:

```
Outputs:
aws_ip = "34.203.35.202"
aws_ssh_connection_string = "ssh -i ~/.ssh/id_rsa ubuntu@34.203.35.202"
```

- Access web UI of Jenkins `aws_ip:8080`:

**login**: `admin`

**password**: obtaint from the instance by executing `cat /jenkins_docker/pass.txt`

- Jenkins is automatically provisioned and runs in Docker container [install_docker_jenkins.sh](https://github.com/serhieiev/gl-hw9/blob/main/modules/aws/install_docker_jenkins.sh)

- Jenkins related files are stored under `config` dir

- Check Video Demo down below to see Jenkins pipeline in action (Slack integration, plugins)

## Video Demo

https://user-images.githubusercontent.com/12089303/215190472-268ec272-85aa-4743-962a-ae4942ec9a4b.mp4




