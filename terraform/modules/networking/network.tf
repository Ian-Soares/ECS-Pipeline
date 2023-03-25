resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = merge(
    var.tags,
    {
      Name = var.vpc_name
    }
  )
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    var.tags,
    {
      Name = var.igw_name
    }
  )
}

resource "aws_eip" "nat_gw_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.main]
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = aws_subnet.public.0.id

  tags = merge(
    var.tags,
    {
      Name = var.nat_gw_name
    }
  )

  depends_on = [aws_internet_gateway.main]
}