#Public Route Table Create

resource "aws_route_table" "mh_dev_public"{
	vpc_id = "${aws_vpc.dev.id}"

	route{
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.igw.id}"
	}


	tags{
		Name = "${var.pub_rt}"
	}
}

#Public association

resource "aws_route_table_association" "mh_dev_public_1a"{
	subnet_id = "${aws_subnet.public01a.id}"
	route_table_id = "${aws_route_table.mh_dev_public.id}"
}
resource "aws_route_table_association" "mh_dev_public_1c"{
	subnet_id = "${aws_subnet.public02c.id}"
	route_table_id = "${aws_route_table.mh_dev_public.id}"	
}


#Private Route Table Create

resource "aws_route_table" "mh_dev_private"{
	vpc_id = "${aws_vpc.dev.id}"

	route{
		cidr_block = "0.0.0.0/0"
		nat_gateway_id = "${aws_nat_gateway.natgt.id}"
	}


	tags{
		Name = "${var.pri_rt}"
	}
} 

#Praivate association (WEB,WAS)

resource "aws_route_table_association" "mh_dev_private_web_1a"{
	subnet_id = "${aws_subnet.privateWeb01a.id}"
	route_table_id = "${aws_route_table.mh_dev_private.id}"
}
resource "aws_route_table_association" "mh_dev_private_web_1c"{
	subnet_id = "${aws_subnet.privateWeb02c.id}"
	route_table_id = "${aws_route_table.mh_dev_private.id}"	
}

resource "aws_route_table_association" "mh_dev_private_was_1a"{
	subnet_id = "${aws_subnet.privateWas01a.id}"
	route_table_id = "${aws_route_table.mh_dev_private.id}"
}
resource "aws_route_table_association" "mh_dev_private_was_1c"{
	subnet_id = "${aws_subnet.privateWas02c.id}"
	route_table_id = "${aws_route_table.mh_dev_private.id}"	
}


#Data association (data subnet 필요할 경우 사용)

# #Data  association
# resource "aws_route_table_association" "medialog_dev_data_1a"{
# 	subnet_id = "${aws_subnet.data01a.id}"
# 	route_table_id = "${aws_route_table.alnaysis_dev_private.id}"
# }
# resource "aws_route_table_association" "medialog_dev_data_1c"{
# 	subnet_id = "${aws_subnet.data02c.id}"
# 	route_table_id = "${aws_route_table.alnaysis_dev_private.id}"	
# }
