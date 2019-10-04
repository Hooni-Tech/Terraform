# Bastion SG
resource "aws_security_group" "mh_DEV_Bastion_SG"{
	name = "mh_DEV_Bastion_SG"
	description = "mh_DEV_Bastion_SG"
	vpc_id = "${aws_vpc.dev.id}"

ingress{
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	description = "Office"

}

egress{
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]

}

tags{
	Name = "mh_DEV_Bastion_SG"
}
}

# WEB SG
resource "aws_security_group" "mh_DEV_WEB_SG"{
	name = "mh_DEV_WEB_SG"
	description = "mh_DEV_WEB_SG"
	vpc_id = "${aws_vpc.dev.id}"

ingress{
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["10.10.0.0/20"]
	description = "Internal VPC"

}

ingress{
	from_port = 80
	to_port = 80
	protocol = "tcp"
	cidr_blocks = ["10.10.0.0/20"]
	description = "HTTP"

}

egress{
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]

}

tags{
	Name = "mh_DEV_WEB_SG"
}
}

# WAS SG
resource "aws_security_group" "mh_DEV_WAS_SG"{
	name = "mh_DEV_WAS_SG"
	description = "mh_DEV_WAS_SG"
	vpc_id = "${aws_vpc.dev.id}"

ingress{
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["10.10.0.0/20"]
	description = "Internal VPC"

}

ingress{
	from_port = 8080
	to_port = 8080
	protocol = "tcp"
	cidr_blocks = ["10.10.0.0/20"]
	description = "Tomcat"

}

egress{
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]

}

tags{
	Name = "mh_DEV_WAS_SG"
}
}

# RDS SG
resource "aws_security_group" "mh_DEV_DATA_SG"{
	name = "mh_DEV_DATA_SG"
	description = "mh_DEV_DATA_SG"
	vpc_id = "${aws_vpc.dev.id}"

ingress{
	from_port = 3306
	to_port = 3306
	protocol = "tcp"
	cidr_blocks = ["10.10.0.0/20"]
	description = "Internal VPC"

}

egress{
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]

}

tags{
	Name = "mh_DEV_DATA_SG"
}
}

# WEB ALB SG
resource "aws_security_group" "mh-DEV-WEB-ALB-SG"{
	name = "mh-DEV-WEB-ALB-SG"
	description = "mh-DEV-WEB-ALB-SG"
	vpc_id = "${aws_vpc.dev.id}"

ingress{
	from_port = 80
	to_port = 80
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	description = "HTTP"

}

egress{
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]

}

tags{
	Name = "mh-DEV-WEB-ALB-SG"
}
}


# WAS ALB SG
resource "aws_security_group" "mh-DEV-WAS-ALB-SG"{
	name = "mh-DEV-WAS-ALB-SG"
	description = "mh-DEV-WAS-ALB-SG"
	vpc_id = "${aws_vpc.dev.id}"

ingress{
	from_port = 8080
	to_port = 8080
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	description = "Tomcat"

}

ingress{
	from_port = 8009
	to_port = 8009
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	description = "Tomcat"

}

egress{
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]

}

tags{
	Name = "mh-DEV-WAS-ALB-SG"
}
}