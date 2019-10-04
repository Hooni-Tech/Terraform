## A zone ##

resource "aws_subnet" "public01a"{
	vpc_id				= "${aws_vpc.dev.id}"
	availability_zone	= "${var.az_zone_a}"
	cidr_block			= "10.10.0.0/24"

	tags {
		Name = "${var.public_subnet_a}"
	}
}

resource "aws_subnet" "privateWeb01a"{
	vpc_id				= "${aws_vpc.dev.id}"
	availability_zone	= "${var.az_zone_a}"
	cidr_block			= "10.10.1.0/24"

	tags {
		Name = "${var.private_Web_subnet_a}"
	}
}

resource "aws_subnet" "privateWas01a"{
	vpc_id				= "${aws_vpc.dev.id}"
	availability_zone	= "${var.az_zone_a}"
	cidr_block			= "10.10.2.0/24"

	tags {
		Name = "${var.private_Was_subnet_a}"
	}
}

resource "aws_subnet" "data01a"{
	vpc_id				= "${aws_vpc.dev.id}"
	availability_zone	= "${var.az_zone_a}"
	cidr_block			= "10.10.3.0/24"

	tags {
		Name = "${var.data_subnet_a}"
	}
}

## C zone ##

resource "aws_subnet" "public02c"{
	vpc_id				= "${aws_vpc.dev.id}"
	availability_zone	= "${var.az_zone_c}"
	cidr_block			= "10.10.4.0/24"

	tags {
		Name = "${var.public_subnet_c}"

	}
}

resource "aws_subnet" "privateWeb02c"{
	vpc_id				= "${aws_vpc.dev.id}"
	availability_zone	= "${var.az_zone_c}"
	cidr_block			= "10.10.5.0/24"

	tags {
		Name = "${var.private_Web_subnet_c}"
	}
}

resource "aws_subnet" "privateWas02c"{
	vpc_id				= "${aws_vpc.dev.id}"
	availability_zone	= "${var.az_zone_c}"
	cidr_block			= "10.10.6.0/24"

	tags {
		Name = "${var.private_Was_subnet_c}"
	}
}

resource "aws_subnet" "data02c"{
	vpc_id				= "${aws_vpc.dev.id}"
	availability_zone	= "${var.az_zone_c}"
	cidr_block			= "10.10.7.0/24"

	tags {
		Name = "${var.data_subnet_c}"
	}
}

# DB Subnet Group
resource "aws_db_subnet_group" "dev-rds-subnet-group" {
  name       = "${var.data_subnet_group}"
  subnet_ids = ["${aws_subnet.data01a.id}", "${aws_subnet.data02c.id}"]

  tags = {
    Name = "${var.data_subnet_group}"
  }

}