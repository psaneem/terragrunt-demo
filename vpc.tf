terraform {
    backend "remote" {
        hostname = "app.terraform.io"
        organization = "healtpharm"

        workspaces {
            name = "acme"
        }
    }
}

provider "aws" {
    #region = "${local.aws_region}"
    region = "us-east-1"
    }


resource "aws_vpc" "main" {
  cidr_block           = var.cidr
}
