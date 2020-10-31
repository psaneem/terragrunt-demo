als {
  common_tags {
    "Vertical"      = "${var.tag_vertical}"
    "Application"   = "${var.tag_application}"
    "Environment"   = "${var.tag_environment}"
    "ProvisionedBy" = "terraform"
  }

  local_vpc_name         = "aws-${var.region}-${local.common_tags["Vertical"]}-${local.common_tags["Application"]}-${local.common_tags["Environment"]}"
  #cloudwatch_destination = "arn:aws:logs:${var.region}:348426448370:destination:sec_flowlogs_cwd"
}

#####
#Data Sources
#####
data "aws_caller_identity" "current" {}

#data "aws_iam_account_alias" "current" {}

#data "aws_ec2_transit_gateway" "main" {}

data "aws_availability_zones" "azs" {}

#data "template_file" "checkpoint_config" {
#  template = "${file("${path.module}/checkpoint_config.tpl")}"

#  vars {
#    vpc_name    = "${local.local_vpc_name}"
#    vpc_netaddr = "${cidrhost(aws_vpc.main.cidr_block,0)}"
#    vpc_netmask = "${cidrnetmask(aws_vpc.main.cidr_block)}"
#  }
#}

#####
#Basic VPC Infrastructure
#####

resource "aws_vpc" "main" {
  cidr_block           = "${var.vpc_supernet}"
  enable_dns_hostnames = "${var.enable_public_dns_hostnames && var.enable_vpc_dns ? "true" : "false"}"
  enable_dns_support   = "${var.enable_vpc_dns ? "true" : "false"}"

  tags = "${merge(
    local.common_tags,
    map(
      "Name", "${local.local_vpc_name}",
      "DataClassification", "confidential",
      "PubliclyAccessible", "false",
      "app_tag","${var.app_tag}"
      )
      )}"
}
