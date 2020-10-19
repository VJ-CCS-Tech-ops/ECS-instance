terraform {
  required_version = "~> 0.11"

}

data "aws_caller_identity" "current" {}

locals {
    bucket_name = "ccs.${data.aws_caller_identity.current.account_id}.tfstate"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "${local.bucket_name}"

  versioning {
    enabled = true
  }

  lifecycle {
    ignore_changes = [
        "bucket",
        ]
  }
}
