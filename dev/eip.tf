resource "aws_eip" "eip_nat"{
	tags{
		Name = "${var.nat_eip}"
	}
}

resource "aws_eip" "eip_dev_bastion" {
	vpc = true
	#instance = "${aws_instance.mh_DEV_Bastion.id}"
	network_interface = "${aws_network_interface.mh_DEV_Bastion_ENI.id}"
	associate_with_private_ip = "10.10.0.10"
	tags{
		Name = "${var.bastion_eip}"
	}
}