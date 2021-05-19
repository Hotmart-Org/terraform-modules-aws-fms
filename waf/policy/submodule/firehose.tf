data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

locals {
  name = "${var.policy_name}-${var.scope == "REGIONAL" ? data.aws_region.current.name : "global"}"
}

resource "aws_iam_role" "firehose-role" {
  name = "aws-waf-logs-fms-${local.name}-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "firehose-role-policy" {
  name        = "aws-waf-logs-fms-${local.name}-policy"
  path        = "/"
  description = "aws-waf-logs-fms-${local.name} policy"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "glue:GetTable",
                "glue:GetTableVersion",
                "glue:GetTableVersions"
            ],
            "Resource": [
                "arn:aws:glue:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:catalog",
                "arn:aws:glue:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:database/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%",
                "arn:aws:glue:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:table/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
            ]
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "s3:AbortMultipartUpload",
                "s3:GetBucketLocation",
                "s3:GetObject",
                "s3:ListBucket",
                "s3:ListBucketMultipartUploads",
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": [
                "${var.logging_bucket_arn}",
                "${var.logging_bucket_arn}/*"
            ]
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunction",
                "lambda:GetFunctionConfiguration"
            ],
            "Resource": "arn:aws:lambda:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:function:%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
        },
        {
            "Effect": "Allow",
            "Action": [
                "kms:GenerateDataKey",
                "kms:Decrypt"
            ],
            "Resource": [
                "arn:aws:kms:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:key/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
            ],
            "Condition": {
                "StringEquals": {
                    "kms:ViaService": "s3.${data.aws_region.current.name}.amazonaws.com"
                },
                "StringLike": {
                    "kms:EncryptionContext:aws:s3:arn": [
                        "arn:aws:s3:::%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%/*"
                    ]
                }
            }
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/kinesisfirehose/aws-waf-logs-fms-${local.name}:log-stream:*"
            ]
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Action": [
                "kinesis:DescribeStream",
                "kinesis:GetShardIterator",
                "kinesis:GetRecords",
                "kinesis:ListShards"
            ],
            "Resource": "arn:aws:kinesis:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:stream/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
        },
        {
            "Effect": "Allow",
            "Action": [
                "kms:Decrypt"
            ],
            "Resource": [
                "arn:aws:kms:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:key/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
            ],
            "Condition": {
                "StringEquals": {
                    "kms:ViaService": "kinesis.${data.aws_region.current.name}.amazonaws.com"
                },
                "StringLike": {
                    "kms:EncryptionContext:aws:kinesis:arn": "arn:aws:kinesis:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:stream/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
                }
            }
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "firehose_role_attachment" {
  policy_arn = aws_iam_policy.firehose-role-policy.arn
  role       = aws_iam_role.firehose-role.name
}

resource "aws_kinesis_firehose_delivery_stream" "firehose" {
  name        = "aws-waf-logs-fms-${local.name}"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn           = aws_iam_role.firehose-role.arn
    bucket_arn         = var.logging_bucket_arn
    compression_format = "GZIP"
    buffer_size         = 128
    buffer_interval     = 300

    prefix              = "policy=${var.policy_name}/scope=${var.scope == "REGIONAL" ? data.aws_region.current.name : "global"}/date=!{timestamp:yyyy-MM-dd}/hour=!{timestamp:HH}/"
    error_output_prefix = "firehose-error/error-type=!{firehose:error-output-type}/date=!{timestamp:yyyy-MM-dd}/hour=!{timestamp:HH}/"

    cloudwatch_logging_options {
      enabled = true
      log_group_name = "/aws/kinesisfirehose/aws-waf-logs-fms-${local.name}"
      log_stream_name = "S3Delivery"
    }
  }
}

resource "aws_cloudwatch_log_group" "log" {
  name = "/aws/kinesisfirehose/aws-waf-logs-fms-${local.name}"
}

resource "aws_cloudwatch_log_stream" "stream" {
  name           = "S3Delivery"
  log_group_name = aws_cloudwatch_log_group.log.name
}