resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.dev.id}"
  tags {
    Name = "${var.igw}"
  }
}