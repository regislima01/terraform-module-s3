module "bucket_s3" {
    source                              = "../terraform-s3-module.beta"
    bucket_name                         = var.bucket_name
    acl                                 = var.acl
    region                              = var.region
    versioning                          = var.versioning
    kms_master_key_id                   = var.kms_master_key_id
    sse_algorithm                       = var.sse_algorithm
    tags                                = var.tags
    force_destroy                       = var.force_destroy
    request_payer                       = var.request_payer     
    bucket_prefix                       = var.bucket_prefix
    acceleration_status                 = var.acceleration_status
    restrict_public_buckets             = var.restrict_public_buckets
    block_public_acls                   = var.block_public_acls
    block_public_policy                 = var.block_public_policy 
    ignore_public_acls                  = var.ignore_public_acls 
    lifecycle_rule_enabled              = var.lifecycle_rule_enabled
    standard_transition_days            = var.standard_transition_days
    glacier_transition_days             = var.glacier_transition_days
    enable_glacier_transition           = var.enable_glacier_transition
    enable_standard_ia_transition       = var.enable_standard_ia_transition
    enable_current_object_expiration    = var.enable_current_object_expiration
    expiration_days                     = var.expiration_days 
    policy_file                         = file(var.policy_file)
}

