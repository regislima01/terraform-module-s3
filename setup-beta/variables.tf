variable "bucket_name" {
  description = "The name of the bucket. (forces new resource, default: unique random name)"
  type        = string
}

variable "acl" {
    type        = string
    description = "(Optional) The canned ACL to apply. Defaults to private. Conflicts with grant."
}
variable "region" {
  type = string
  description = "(optional) describe your variable"
}

variable "versioning" {
    type        = bool
    description = "(Optional) A state of versioning."
}

variable "kms_master_key_id" {
    type        = string
    description = "(optional) The AWS KMS master key ID used for the SSE-KMS encryption. This can only be used when you set the value of sse_algorithm as aws:kms. The default aws/s3 AWS KMS master key is used if this element is absent while the sse_algorithm is aws:kms."
}

variable "sse_algorithm" {
    type        = string
    description = "(required) The server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
}

variable "tags" {
    type        = map(string)
    description = "Acompanhe o custo de armazenamento ou outros critérios tagging seu bucket"
}

variable "restrict_public_buckets" {
  type = bool
  description = "(optional) describe your variable"
}

variable "block_public_acls" {
  type        = bool
  description = "Set to `false` to disable the blocking of new public access lists on the bucket"
}

variable "block_public_policy" {
  type        = bool
  description = "Set to `false` to disable the blocking of new public policies on the bucket"
}

variable "ignore_public_acls" {
  type = bool 
}

variable "request_payer" {
  type        = string
  description = "(optional) Identifier for Request Cost-allocation of S3 Bucket"
}

# Aqui começamos a inicar o nosso ciclo de vida dos objetos no bucket.
variable "lifecycle_rule_enabled" {
    type        = bool
    description = "Enable or disable lifecycle rule"
}

variable "standard_transition_days" {
  type        = number
  description = "Number of days to persist in the standard storage tier before moving to the infrequent access tier"
}

variable "glacier_transition_days" {
  type        = number
  description = "Number of days after which to move the data to the glacier storage tier"
}

variable "enable_glacier_transition" {
  type        = bool
  description = "Enables the transition to AWS Glacier which can cause unnecessary costs for huge amount of small files"
}

variable "enable_standard_ia_transition" {
  type        = bool
  description = "Enables the transition to STANDARD_IA or ONEZONE_IA" 
}

variable "enable_current_object_expiration" {
  type        = bool
  description = "Enables the expiration of current objects"
}

variable "expiration_days" {
  type        = number
  description = "Number of days after which to expunge the objects"
}

variable "bucket_prefix" {
    type        = string
    description = "(required since we are not using 'bucket') Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket."
    default     = ""
}

variable "policy_file" {
  type = string
  description = "(optional) describe your variable"

}

variable "force_destroy" {
  description = "(Optional, Default:false ) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  type        = bool
}

variable "acceleration_status" {
  description = "(Optional) Sets the accelerate configuration of an existing bucket. Can be Enabled or Suspended."
  type        = string
}