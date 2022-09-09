resource "aws_eip" "neip" {
  vpc = true
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.neip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "natgw"
  }
}
