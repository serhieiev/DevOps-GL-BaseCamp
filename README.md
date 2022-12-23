# GL Homework 4

## _General overview_

Terraform script used to spin up the GCP infrustructure and bash script to provision WordPress on it.

Includes the following resources:

- GCP VPC
- GCP VPC Subnetwork
- GCP Firewall
- GCP VM
- bash script to provision WordPress instalation and initial configuration

The best practices for using Terraform suggested by Google Cloud have been used for this configuration [link](https://cloud.google.com/docs/terraform/best-practices-for-terraform) such as:

- Declare all variables in `variables.tf`
- Organize all outputs in an `outputs.tf` file
- All Terraform files must conform to the standards of `terraform fmt`
- Defined backend where Terraform stores its state data files
- etc.

## _Installation_

Dependencies:

- Terraform >= v1.3.0
- Google Cloud SDK >= 412.0.0

Create GCP Storage Bucket in order to serve your Terraform state file with the following command:

```
gcloud storage buckets create gs://BUCKET_NAME --project=PROJECT_ID --default-storage-class=STORAGE_CLASS --location=BUCKET_LOCATION --uniform-bucket-level-access
```

or check the official Google Cloud documentation for more information [link](https://cloud.google.com/storage/docs/creating-buckets#permissions-cli)

### _Steps_

- Clone repo to your local machine
- In the root project directory create `terraform.tfvars` file to define your project settings:

```
# GCP BE
be_bucket =

# GCP Settings
gcp_project   =
gcp_region_1  =
gcp_zone_1    =
gcp_auth_file =

# GCP Netwok
public_subnet_cidr_1 =
```

- Add name of your bucket created above to the `bucket` of the `main.tf` file
- Init Terraform with `terraform init` command
- Perform `terraform plan` command
- Start resources creation with `terraform apply` command

## _Post installation_

- Make sure `terraform apply` command is executed successfully like:
  `Apply complete! Resources: 8 added, 0 changed, 0 destroyed.`
- Review the `Outputs` section and copy the `external_ip` value
- Paste copied value into the browser and make sure WordPress configuration is promted like on the screenshot below:
<img width="828" alt="WordPress_Installation" src="https://user-images.githubusercontent.com/12089303/209408508-dbd51652-c9eb-4614-98e2-ec4298a06717.png">
- Optionally: ssh into VM and perform `cat /tmp/creds.txt` to obtaint generated passwords
