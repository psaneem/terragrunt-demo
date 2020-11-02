#variable "vpc_supernet" {} 
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_supernet
}
