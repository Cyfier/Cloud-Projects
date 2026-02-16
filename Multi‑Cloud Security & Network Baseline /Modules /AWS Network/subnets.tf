resource "aws_subnet" "dev" {
  vpc_id                  = aws_vpc.MultiCloud.id
  cidr_block              = "10.1.0.0/24"
  availability_zone       = var.az1
  map_public_ip_on_launch = false
}

resource "aws_subnet" "prod" {
  vpc_id            = aws_vpc.MultiCloud.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = var.az1
}

resource "aws_subnet" "app" {
  vpc_id            = aws_vpc.MultiCloud.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = var.az1
}

resource "aws_subnet" "data" {
  vpc_id            = aws_vpc.MultiCloud.id
  cidr_block        = "10.1.3.0/24"
  availability_zone = var.az1
}