variable "vpc_supernet" {
  default = "10.0.0.0/16"
  } 
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_supernet
}
