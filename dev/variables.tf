## Provider
# Region
variable "region" {
  default = "ap-northeast-2"
}

# Credentials Path
variable "creds_path" {
  default = "/Users/user/.aws/credentials"
}

# Credentials Profile
variable "profile" {
  default = "mhcred"
}

## VPC
variable "vpc" {
  default = "dev-vpc"
}

## IGW
variable "igw" {
  default = "dev-igw"
}

## NAT
variable "nat" {
  default = "dev-nat"
}

## EIP
# NAT-EIP
variable "nat_eip" {
  default = "dev_nat_eip"
}
# Bastion-EIP
variable "bastion_eip" {
  default = "dev_bastion_eip"
}

## Availability zone
variable "az_zone_a" {
  default = "ap-northeast-2a"
}

variable "az_zone_c" {
  default = "ap-northeast-2c"
}

## Subnet Name

variable "public_subnet_a" {
  default = "dev_pub_a"
}

variable "public_subnet_c" {
  default = "dev_pub_c"
}

variable "private_Web_subnet_a" {
  default = "dev_pri_web_a"
}

variable "private_Web_subnet_c" {
  default = "dev_pri_web_c"
}

variable "private_Was_subnet_a" {
  default = "dev_pri_was_a"
}

variable "private_Was_subnet_c" {
  default = "dev_pri_was_c"
}

variable "data_subnet_a" {
  default = "dev_data_a"
}

variable "data_subnet_c" {
  default = "dev_data_c"
}

## RDS Subnet Group Name
variable "data_subnet_group" {
  default = "dev-rds-subnet-group"
}

## RouteTable
# Public
variable "pub_rt" {
  default = "dev-pub-rt"
}

# Private
variable "pri_rt" {
  default = "dev-pri-rt"
}

## EC2 

# PEM KEY NAME
variable "pem_key" {
  #default = "mh-dev-key"
  default = "mh-dev-seoul-key"
}

# Bastion Instance Name
variable "bastion" {
  default = "mh_dev_bastion"
}

# WEB Instance Name
variable "web" {
  default = "mh_dev_web"
}

# WAS Instance Name
variable "was" {
  default = "mh_dev_was"
}

## ELB
# WEB ELB Name
variable "web_elb" {
  default = "dev-web-alb"
}

# WEB ELB Target Group Name
variable "web_elb_tg" {
  default = "dev-web-alb-tg"
}

# WAS ELB Name
variable "was_elb" {
  default = "dev-was-alb"
}

# WAS ELB Target Group Name
variable "was_elb_tg" {
  default = "dev-was-alb-tg"
}

## RDS Aurora
variable "cluster_identifier" {
  default = "mh-dev-cluster"
}

variable "rds_availability_zones" {
  default = "ap-northeast-2a" # Single 구성
}

variable "rds_engine" {
  default = "aurora-mysql" # Aurora2 사용 시 "Aurora-mysql or Aurora-postgresql"
}

variable "rds_engine_version" {
  default = "5.7.mysql_aurora.2.03.2" # 엔진 버전에 대해서도 정확히 확인할 필요가 있다 (Aurora1, Aurora2 버전마다 또 다름)
}

variable "rds_db_name" {
  default = "mhdevdb" # DB Name
}

variable "rds_master_username" {
  default = "devadmin" # DB username
}

variable "rds_master_password" {
  default = "mhdevrds1!" # DB password
}

variable "rds_port" {
  default = "3306" # DB port
}

variable "rds_backup_retention_period" {
  default = "7" # DB Backup 주기
}

variable "rds_preferred_backup_window" {
  default = "18:00-18:30" # DB Backup 시간
}

variable "rds_preferred_maintenance_window" {
  default = "Sat:20:00-Sat:20:30" # RDS Maintenance
}

variable "rds_skip_final_snapshot" {
  default = "true" # 삭제 시 스냅샷을 생성하지 않음
}

variable "rds_cluster_tag_name" {
  default = "mh-dev-cluster" #
}

# RDS Aurora Instance
variable "rds_instance_class" {
  default = "db.t3.medium" #
}

variable "rds_auto_minor_version_upgrade" {
  default = "false" #
}

variable "rds_intance_tag_name" {
  default = "mh-dev-db-instance" #
}
