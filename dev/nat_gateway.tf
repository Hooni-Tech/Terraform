resource "aws_nat_gateway" "natgt" {
	allocation_id = "${aws_eip.eip_nat.id}"
	subnet_id	  = "${aws_subnet.public01a.id}"

	tags{
		Name = "${var.nat}"
	}
}