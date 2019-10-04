resource "aws_network_interface" "mh_DEV_Bastion_ENI" {
  subnet_id = "${aws_subnet.public01a.id}"
  private_ips = ["10.10.0.10"]
  security_groups = ["${aws_security_group.mh_DEV_Bastion_SG.id}"]

  tags {
    Name = "mh_DEV_Bastion_ENI"
  }
}


resource "aws_network_interface" "mh_DEV_WEB_ENI" {
  subnet_id = "${aws_subnet.privateWeb01a.id}"
  private_ips = ["10.10.1.10"]
  security_groups = ["${aws_security_group.mh_DEV_WEB_SG.id}"]

  tags {
    Name = "mh_DEV_WEB_ENI"
  }
}


resource "aws_network_interface" "mh_DEV_WAS_ENI" {
  subnet_id = "${aws_subnet.privateWas01a.id}"
  private_ips = ["10.10.2.10"]
  security_groups = ["${aws_security_group.mh_DEV_WAS_SG.id}"]
  
  tags {
    Name = "mh_DEV_WAS_ENI"
  }
}
