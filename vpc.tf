terraform {
    backend "remote" {
        hostname = "app.terraform.io"
        organization = "healtpharm"

        workspaces {
            name = "acme"
        }
    }
}
resource "aws_vpc" "main" {
  cidr_block           = var.cidr
}
