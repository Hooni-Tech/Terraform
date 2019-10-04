#### Aurora MYSQL
### 인스턴스 AZ를 변경하게 되면 클러스터 및 인스턴스를 삭제 후 재생성 한다....
### destroy 할 경우 Cluster On 상태에서 삭제 가능 (RDS 삭제가 시간이 걸려 Subnet Group 등이 일부 삭제가 안될 수 있다, 다시 삭제하거나 타임아웃 설정 가능한지 확인)

# ## Aurora Cluster
# resource "aws_rds_cluster" "mh-dev-cluster" {
#   cluster_identifier = "${var.cluster_identifier}"
#   availability_zones = ["${var.rds_availability_zones}"] # Single 구성
#   engine             = "${var.rds_engine}"               # Aurora2 사용 시 "Aurora-mysql or Aurora-postgresql"
#   engine_version     = "${var.rds_engine_version}"    # 엔진 버전에 대해서도 정확히 확인할 필요가 있다 (Aurora1, Aurora2 버전마다 또 다름)
#   vpc_security_group_ids = ["${aws_security_group.mh_DEV_DATA_SG.id}"]
#   db_subnet_group_name = "${var.data_subnet_group}" # Cluster 와 Instance Subnet Group이 동일해야함
#   database_name      = "${var.rds_db_name}"
#   master_username    = "${var.rds_master_username}"
#   master_password    = "${var.rds_master_password}"
#   port               = "${var.rds_port}"
#   backup_retention_period = "${var.rds_backup_retention_period}"
#   preferred_backup_window = "${var.rds_preferred_backup_window}"
#   preferred_maintenance_window = "${var.rds_preferred_maintenance_window}"
#   skip_final_snapshot = "${var.rds_skip_final_snapshot}" # 삭제 시 스냅샷을 생성하지 않음
#   #deletion_protection = true # 삭제 방지

#   tags { 
#     Name = "${var.rds_cluster_tag_name}" 
#     }
# }

# ## Aurora Instance
# resource "aws_rds_cluster_instance" "mh-dev-db" {
#   identifier         = "${var.cluster_identifier}" ## RDS 인스턴스 식별자
#   cluster_identifier = "${aws_rds_cluster.mh-dev-cluster.id}" ## RDS Cluster 식별자 
#   availability_zone  = "${var.rds_availability_zones}" ## RDS 인스턴스의 AZ를 변경하게 되면 기존 인스턴스는 삭제되고 새로운 인스턴스가 변경 한 AZ에 생성
#   instance_class     = "${var.rds_instance_class}" 
#   engine             = "${var.rds_engine}" ## 엔진 종류
#   engine_version     = "${var.rds_engine_version}"
#   auto_minor_version_upgrade = "${var.rds_auto_minor_version_upgrade}" ## Minor 버전 업그레이드 여부
#   db_subnet_group_name = "${var.data_subnet_group}" # Cluster 와 Instance Subnet Group 은 동일해야함

#   tags { 
#     Name = "${var.rds_intance_tag_name}" 
#     }
# }


#### General RDS 

resource "aws_db_instance" "mh-dev-mysql" {
  identifier = "mh-dev-mysql"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.small"
  name                 = "devdb"
  username             = "mhdev"
  password             = "mhdev1!!"
  parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = ["${aws_security_group.mh_DEV_DATA_SG.id}"]
  auto_minor_version_upgrade = false
  db_subnet_group_name = "${var.data_subnet_group}"
  deletion_protection = false
  maintenance_window = "Sat:19:00-Sat:19:30"
  backup_window      = "21:00-21:30"
  backup_retention_period = "7"
   tags { 
    Name = "${var.rds_intance_tag_name}" 
    }
}