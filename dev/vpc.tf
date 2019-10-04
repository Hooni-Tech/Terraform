resource "aws_vpc" "dev" {
	cidr_block				 =	"10.10.0.0/20"
	enable_dns_hostnames	 = true
	enable_dns_support       = true
	instance_tenancy		 = "default"	

	tags{
		Name = "${var.vpc}"
	}
}