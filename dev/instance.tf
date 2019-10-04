# Linux Bastion (Amazon1)
resource "aws_instance" "mh_DEV_Bastion" {
  ami = "ami-0f953b501bea0bda8" # Bastion AMI
  instance_type = "t3.medium" ## 자동으로 재부팅을 통하여 Type 변경 가능 (Terminated 되지 않는다)
  # root_block_device {
  #   volume_size = "30"
  # }
  availability_zone = "${var.az_zone_a}"
  #associate_public_ip_address = true
  network_interface {
     network_interface_id = "${aws_network_interface.mh_DEV_Bastion_ENI.id}"
     device_index = 0
  }
  key_name = "${var.pem_key}"
  #subnet_id = "${aws_subnet.public01a.id}"
  # vpc_security_group_ids = [
  #   "${aws_security_group.mh_DEV_Bastion_SG.id}"
  # ]

  tags {
      Name = "${var.bastion}"
  }

}

# Linux WEB (Amazon1)
resource "aws_instance" "mh_DEV_WEB" {
  ami = "ami-07aa775dcb7d20a30" # WEB AMI
  instance_type = "t3.medium"
  # root_block_device {
  #   volume_size = "100"
  # }
  availability_zone = "${var.az_zone_a}"
  network_interface {
     network_interface_id = "${aws_network_interface.mh_DEV_WEB_ENI.id}"
     device_index = 0   ## 연결 순서에 따른 네트워크 인터페이스 위치 (기본 네트워크 인퍼페이스의 디바이스 인덱스는 "0")
  }
  key_name = "${var.pem_key}"
  #subnet_id = "${aws_subnet.private01a.id}"
  # vpc_security_group_ids = [
  #   "${aws_security_group.mh_DEV_WEB_SG.id}"
  # ]

  tags {
      Name = "${var.web}"
  }

}

# Linux WAS (Amazon1)
resource "aws_instance" "mh_DEV_WAS" {
  ami = "ami-04517eaaa60365e5a" # WAS AMI
  instance_type = "t3.medium"
  # root_block_device {
  #   volume_size = "100"
  # }
  availability_zone = "${var.az_zone_a}"
  network_interface {
     network_interface_id = "${aws_network_interface.mh_DEV_WAS_ENI.id}"
     device_index = 0
  }
  key_name = "${var.pem_key}"
  #subnet_id = "${aws_subnet.private01a.id}"
  # vpc_security_group_ids = [
  #   "${aws_security_group.mh_DEV_WAS_SG.id}"
  # ]

  tags {
      Name = "${var.was}"
  }

}