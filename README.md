# terraform-module-s3
This Module will create tree s3 buckets. with reports hourly, daily, weekly.

First of all, I made this module thinking that your **AWS CLI** is configurated locally in your machine (./aws/credentials).
You can pass your Access key and the Secret key inside the code, but it's not secure.

In this code, I used **terraform version 0.14**

We will work in different workspaces inside the terraform, a workspace for **hourly**, **daily**, and **weekly**.

You can create the three workspaces using the command :  **terraform workspace new hourly**, **terraform workspace new daily** and then **terraform workspace new weekly**.

You need to execute **terraform init** in all workspaces.

You can switch the workspaces using the command: **terraform workspace select hourly** | **terraform workspace select daily** | **terraform workspace select weekly**.

If you don't know what is your workspace that you are, you can run the command: **terraform workspace list** and you see something like:

    default <br />
  <br /> *  hourly <br />
    daily
    weekly <br />

the * indicate in whats your workspace that you're in.

When you inside the workspace hourly for example, you will execute the *.tfvars* with the **same name of the workspace that you're inside in**, for example, if you are in the workspace *hourly*, you must execute the command: **terraform plan -var-file="hourly.tfvars"** and then **terraform apply -var-file="hourly.tfvars"**.  *Did you get it?*

AGAIN

If you are in workspace daily, your command must be: **terraform plan -var-file="daily.tfvars"** and then **terraform apply -var-file="daily.tfvars"**. *So that's it*.

**All parameters that you need to change is inside on hourly.tfvars, daily.tfvars and weekly.tfvars**

*This code you'll be improved in the future and I'll be added more functions.*

## Terraform versions

Terraform 0.14 and above are supported.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| aws | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |


## Inputs

| Variable Name  | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| acceleration\_status | (Optional) Sets the accelerate configuration of an existing bucket. Can be Enabled or Suspended. | `string` | `null` | no |
| acl | (Optional) The canned ACL to apply. Defaults to 'private'. Conflicts with `grant` | `string` | `"private"` | no |
| attach\_policy | Controls if S3 bucket should have bucket policy attached (set to `true` to use value of `policy` as bucket policy) | `bool` | `false` | no |
| attach\_public\_policy | Controls if a user defined public bucket policy will be attached (set to `false` to allow upstream to apply defaults to the bucket) | `bool` | `true` | no |
| block\_public\_acls | Whether Amazon S3 should block public ACLs for this bucket. | `bool` | `false` | no |
| block\_public\_policy | Whether Amazon S3 should block public bucket policies for this bucket. | `bool` | `false` | no |
| bucket | (Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name. | `string` | `null` | no |
| bucket\_prefix | (Optional, Forces new resource) Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. | `string` | `null` | no |
| create\_bucket | Controls if S3 bucket should be created | `bool` | `true` | no |
| force\_destroy | (Optional, Default:false ) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable. | `bool` | `false` | no |
| ignore\_public\_acls | Whether Amazon S3 should ignore public ACLs for this bucket. | `bool` | `false` | no |
| lifecycle\_rule | List of maps containing configuration of object lifecycle management. | `any` | `[]` | no |
| logging | Map containing access bucket logging configuration. | `map(string)` | `{}` | no |
| object\_lock\_configuration | Map containing S3 object locking configuration. | `any` | `{}` | no |
| policy | (Optional) A valid bucket policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide. | `string` | `null` | no |
| request\_payer | (Optional) Specifies who should bear the cost of Amazon S3 data transfer. Can be either BucketOwner or Requester. By default, the owner of the S3 bucket would incur the costs of any data transfer. See Requester Pays Buckets developer guide for more information. | `string` | `null` | no |
| restrict\_public\_buckets | Whether Amazon S3 should restrict public bucket policies for this bucket. | `bool` | `false` | no |
| server\_side\_encryption\_configuration | Map containing server-side encryption configuration. | `any` | `{}` | no |
| tags | (Optional) A mapping of tags to assign to the bucket. | `map(string)` | `{}` | no |
| versioning | Map containing versioning configuration. | `map(string)` | `{}` | no |


## License

GNU General Public License v3.0. See LICENSE for full details.

