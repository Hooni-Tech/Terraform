## ALB Listener 생성

# data "aws_acm_certificate" "example_dot_com"   {
#   domain   = "*.example.com."
#   statuses = ["ISSUED"]
# }

# resource "aws_alb_listener" "https" {
#   load_balancer_arn = "${aws_alb.frontend.arn}"
#   port              = "443"
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   certificate_arn   = "${data.aws_acm_certificate.example_dot_com.arn}"

#   default_action {
#     target_group_arn = "${aws_alb_target_group.frontend.arn}"
#     type             = "forward"
#   }
# }

# WEB Listener
resource "aws_alb_listener" "http" {
  load_balancer_arn = "${aws_alb.mh-dev-web-alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.mh-dev-web-alb-tg.arn}"
    type             = "forward"
  }
}

# WAS Listener
resource "aws_alb_listener" "tomcat8080" {
  load_balancer_arn = "${aws_alb.mh-dev-was-alb.arn}"
  port              = "8080"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.mh-dev-was-alb-tg.arn}"
    type             = "forward"
  }
}

resource "aws_alb_listener" "tomcat8009" {
  load_balancer_arn = "${aws_alb.mh-dev-was-alb.arn}"
  port              = "8009"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.mh-dev-was-alb-tg.arn}"
    type             = "forward"
  }
}