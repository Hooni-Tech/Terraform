## ALB 생성

# WEB ALB
resource "aws_alb" mh-dev-web-alb {
  name            = "${var.web_elb}"
  internal        = false  #External 일 경우 false
  security_groups = ["${aws_security_group.mh-DEV-WEB-ALB-SG.id}"]
  subnets         = [
    "${aws_subnet.public01a.id}", "${aws_subnet.public02c.id}"
   ]

## ALB Access Log Enabled
#   access_logs {
#     bucket  = "${aws_s3_bucket.ALB-Accesslog.id}"
#     prefix  = "mh-dev-web-alb"
#     enabled = true
#   }

  tags {
    Name = "${var.web_elb}"
  }

## lifecycle : Object 값을 교체할 때 값을 변경하지 못하는 Object에 대해서는 기존 Object를 삭제한 뒤 새로운 값으로 Object를 생성한다
## 아래 내용은 교체되는 오브젝트가 먼저 생성 된 뒤 이전 오브젝트를 삭제하는 정책
  lifecycle { 
    create_before_destroy = true 
    }
}


# WAS ALB
resource "aws_alb" mh-dev-was-alb {
  name            = "${var.was_elb}"
  internal        = true  #External 일 경우 false
  security_groups = ["${aws_security_group.mh-DEV-WAS-ALB-SG.id}"]
  subnets         = [
    "${aws_subnet.privateWeb01a.id}", "${aws_subnet.privateWeb02c.id}"
   ]

## ALB Access Log Enabled
#   access_logs {
#     bucket  = "${aws_s3_bucket.ALB-Accesslog.id}"
#     prefix  = "mh-dev-web-alb"
#     enabled = true
#   }

  tags {
    Name = "${var.was_elb}"
  }

## lifecycle : Object 값을 교체할 때 값을 변경하지 못하는 Object에 대해서는 기존 Object를 삭제한 뒤 새로운 값으로 Object를 생성한다
## 아래 내용은 교체되는 오브젝트가 먼저 생성 된 뒤 이전 오브젝트를 삭제하는 정책
  lifecycle { 
    create_before_destroy = true 
    }
}