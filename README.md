# terraform-module-s3.beta
# Before you start anything

Module will create tree s3 buckets. with reports hourly, daily, weekly.

**This is the "hard way" to create these buckets, but it works, after I've made this module I found another way much easier to do the same thing with the "for_each".**

**I'll leave this module here as a study case, you can go to another repository here in my GitHub and look for *terraform-s3-module*.**

First of all, I made this module thinking that your **AWS CLI** is configurated locally in your machine (./aws/credentials).
You can create a variable with your Access key and the Secret key and attach inside the code, but it's not secure.

In this code, I used **terraform version 0.14**

# Let's Start

We will work in different workspaces inside the terraform, a workspace for **hourly**, **daily**, and **weekly**.

You can create the three workspaces using the commands :  **terraform workspace new hourly**, **terraform workspace new daily** and then **terraform workspace new weekly**.

You need to execute **terraform init** in all workspaces.

You can switch the workspaces using the command: **terraform workspace select hourly** | **terraform workspace select daily** | **terraform workspace select weekly**.

If you don't know what workspace you are, you can run the command: **terraform workspace list** and you see something like:

   default <br />
   hourly <br />
   daily
 <br /> * weekly <br />

the * indicates your workspace that you are currently in.

When you get inside the workspace hourly for example, you will execute the *.tfvars* with the **same name of the workspace that you're currently inside in**, for example, if you are in the workspace *hourly*, you must execute the command: **terraform plan -var-file="hourly.tfvars"** and then **terraform apply -var-file="hourly.tfvars"**.  *Did you get it?*

AGAIN

If you are inside workspace daily, your command must be: **terraform plan -var-file="daily.tfvars"** and then **terraform apply -var-file="daily.tfvars"**. 
*So that's it*.

**All default parameters that you need to change is inside on hourly.tfvars, daily.tfvars and weekly.tfvars**


*This code you'll be improved in the future and I'll be added more functions.*


# Working with policies

You will see a folder named **policies**, inside this folder you'll find 3 JSON files: hourly.json, daily.json, and weekly.json, inside these files you can change or modify the policies for the more adequate way you want.

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
| acl | (Optional) The canned ACL to apply. Defaults to 'private'.| `string` | `"private"` | no |
| attach\_policy | Controls if S3 bucket should have bucket policy attached (set to `true` to use value of `policy` as bucket policy) | `bool` | `true` | no |
| attach\_public\_policy | Controls if a user defined public bucket policy will be attached (set to `false` to allow upstream to apply defaults to the bucket) | `bool` | `false` | no |
| block\_public\_acls | Whether Amazon S3 should block public ACLs for this bucket. | `bool` | `true` | no |
| block\_public\_policy | Whether Amazon S3 should block public bucket policies for this bucket. | `bool` | `true` | no |
| bucket_name | The name of the bucket. If omitted, Terraform will assign a random, unique name. | `string` | `null` | no |
| bucket\_prefix | Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. | `string` | `null` | no |
| enable_current_object_expiration | Enables the expiration of current objects. | `bool` | `true` | no |
| enable_glacier_transition | Enables the transition to AWS Glacier which can cause unnecessary costs for huge amount of small files. | `bool` | `true` | no |
| enable_standard_ia_transition | Enables the transition to STANDARD_IA or ONEZONE_IA. | `bool` | `true` | no |
| expiration_days | Number of days after which to expunge the objects. | `number` | `60` | no |
| force\_destroy | (Optional,) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable. | `bool` | `false` | no |
| kms_master_key_id | The AWS KMS master key ID used for the SSE-KMS encryption. This can only be used when you set the value of sse_algorithm as aws:kms. The default aws/s3 AWS KMS master key is used if this element is absent while the sse_algorithm is aws:kms. | `string` | `aws:kms` | no |
| ignore\_public\_acls | Whether Amazon S3 should ignore public ACLs for this bucket. | `bool` | `false` | no |
| lifecycle\_rule\_enabled | List of maps containing configuration of object lifecycle management. | `bool` | `true` | no |
| policy_file | (Optional) A valid bucket policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide. | `string` | `null` | no |
| region | (Optional) Choose your region like: us-east-1 or us-east-2 etc... | `String` | `us-east-1` | no |
| request\_payer | (Optional) Specifies who should bear the cost of Amazon S3 data transfer. Can be either BucketOwner or Requester. By default, the owner of the S3 bucket would incur the costs of any data transfer. See Requester Pays Buckets developer guide for more information. | `string` | `null` | no |
| restrict\_public\_buckets | Whether Amazon S3 should restrict public bucket policies for this bucket. | `bool` | `false` | no |
| server\_side\_encryption\_configuration | Map containing server-side encryption configuration. | `any` | `{}` | no |
| sse_algorithm | The server-side encryption algorithm to use. Valid values are AES256 and aws:kms". | `string` | `AES256` | yes |
| standard\_transition\_days | Number of days to persist in the standard storage tier before moving to the infrequent access tier. | `number` | `30` | no |
| tags | (Optional) A mapping of tags to assign to the bucket. | `map(string)` | `{}` | no |
| versioning | Map containing versioning configuration. | `bool` | `enable` | no |


## License

GNU General Public License v3.0. See LICENSE for full details.

