## ALB Target Group 생성 ##

## HTTP Target Group 생성
resource "aws_alb_target_group" "mh-dev-web-alb-tg" {
  name     = "${var.web_elb_tg}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.dev.id}"

  health_check {
    interval            = 30
    path                = "/"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags { 
    Name = "${var.web_elb_tg}" 
    }
}

# resource "aws_alb_target_group" "static" {
#   name     = "static-target-group"
#   port     = 8080
#   protocol = "HTTP"
#   vpc_id   = "${aws_default_vpc.dmz.id}"

#   health_check {
#     interval            = 30
#     path                = "/ping"
#     healthy_threshold   = 3
#     unhealthy_threshold = 3
#   }

#   tags { Name = "Static Target Group" }
# }


## HTTP Target Group 인스턴스(WEB) 연결
resource "aws_alb_target_group_attachment" "mh-dev-web-alb-tg-att" {
  target_group_arn = "${aws_alb_target_group.mh-dev-web-alb-tg.arn}"
  target_id        = "${aws_instance.mh_DEV_WEB.id}"
  port             = 80
}

# resource "aws_alb_target_group_attachment" "static" {
#   target_group_arn = "${aws_alb_target_group.static.arn}"
#   target_id        = "${aws_instance.static.id}"
#   port             = 8080
# }




## TOMCAT Target Group 생성
resource "aws_alb_target_group" "mh-dev-was-alb-tg" {
  name     = "${var.was_elb_tg}"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.dev.id}"

  health_check {
    interval            = 30
    path                = "/"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags { 
    Name = "${var.was_elb_tg}" 
    }
}

# resource "aws_alb_target_group" "static" {
#   name     = "static-target-group"
#   port     = 8080
#   protocol = "HTTP"
#   vpc_id   = "${aws_default_vpc.dmz.id}"

#   health_check {
#     interval            = 30
#     path                = "/ping"
#     healthy_threshold   = 3
#     unhealthy_threshold = 3
#   }

#   tags { Name = "Static Target Group" }
# }


## TOMCAT Target Group 인스턴스(WAS) 연결
resource "aws_alb_target_group_attachment" "mh-dev-was-alb-tg-att" {
  target_group_arn = "${aws_alb_target_group.mh-dev-was-alb-tg.arn}"
  target_id        = "${aws_instance.mh_DEV_WAS.id}"
  port             = 8080
}

# resource "aws_alb_target_group_attachment" "static" {
#   target_group_arn = "${aws_alb_target_group.static.arn}"
#   target_id        = "${aws_instance.static.id}"
#   port             = 8080
# }