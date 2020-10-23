## Terraform с Нуля до Профессионала

https://www.udemy.com/course/rus-terraform

#### About

Terraform - Программирование Инфраструктуры AWS

#### Links

https://www.terraform.io

https://github.com/adv4000/terraform-lessons

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_subnet

https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html

https://awsregion.info

https://www.terraform.io/docs/modules/sources.html

#### Commands

Set AWS Credentials in Windows PowerShell:
```
$env:AWS_ACCESS_KEY_ID="xxxxxxxxxxxxxxxxx"
$env:AWS_SECRET_ACCESS_KEY="yyyyyyyyyyyyyyyyyyyyyyyyyyyy"
$env:AWS_DEFAULT_REGION="zzzzzzzzz"
```

Set AWS Credentials in Linux Shell:
```
export AWS_ACCESS_KEY_ID="xxxxxxxxxxxxxxxxx"
export AWS_SECRET_ACCESS_KEY="yyyyyyyyyyyyyyyyyyyyyyyyyyyy"
export AWS_DEFAULT_REGION="zzzzzzzzz"
```

Terraform Commands
```
terraform init
terraform plan
terraform apply
terraform destroy

terraform show
terraform output
terraform console
terraform import
terraform taint
```

Terraform State Commands
```
terraform state show
terraform state list
terraform state pull
terraform state rm
terraform state mv
terraform state push
```
`for x in $(terraform state list | grep aws_eip); do terraform state mv -state-out=”terraform.tfstate”  $x $x; done`

Terraform Workspace Commands
```
terraform workspace show
terraform workspace list
terraform workspace new
terraform workspace select
terraform workspace delete
```
`${terraform.workspace}`

##### Commands

```bash
terraform init
terraform plan
terraform apply
terraform apply -auto-approve
terraform destroy
terraform destroy -auto-approve
terraform console
terraform console
terraform show
terraform plan -var="region=us-east-2"
terraform apply -var="region=us-east-2"
terraform plan -var="region=us-east-2" -var="instance_type=t2.micro"
terraform plan -var-file="dev.tfvars"
terraform plan -var-file="prod.tfvars"
terraform plan -var="env=prod"
terraform taint aws_instance.node2
```

