locals {
  common_tags {
    Vertical      = var.tag_vertical
    Application   = "var.tag_application
    Environment   = var.tag_environment
    "ProvisionedBy" = "terraform"
  }

  #local_vpc_name         = "aws-${var.region}-${local.common_tags["Vertical"]}-${local.common_tags["Application"]}-${local.common_tags["Environment"]}"
}

#####
#Data Sources
#####
data "aws_caller_identity" "current" {}


data "aws_availability_zones" "azs" {}


#####
#Basic VPC Infrastructure
#####

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_supernet
}
