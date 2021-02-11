# terraform-module-s3
This Module will create tree s3 buckets. with reports hourly, daily, weekly.

First of all, I made this module thinking that your AWS CLI version 2 is configurated locally in your machine (./aws/credentials).
You can pass your Access key and the Secret key inside the code, but it's not secure.

In this code, I used terraform version 0.14

We will work in different workspaces inside the terraform, a workspace for hourly, daily, and weekly.

You can create the three workspaces using the command :  terraform workspace new hourly, terraform workspace new daily and then terraform workspace new weekly.

You need to execute **terraform init** in all workspaces.

You can switch the workspaces using the command: terraform workspace select hourly / terraform workspace select daily / terraform workspace select weekly.

When you inside the workspace hourly for example, you will execute the .tfvars with the same name of the workspace that you're inside in, for example, if you are in the workspace hourly, you must execute the command: terraform plan -var-file="hourly.tfvars" and then terraform apply -var-file="hourly.tfvars".  Did you get it?

If you are in workspace daily, your command must be: terraform plan -var-file="daily.tfvars" and then terraform apply -var-file="daily.tfvars". So that's it.

This code you'll be improved in the future and I'll be added more functions.
