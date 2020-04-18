resource "aws_alb_target_group" "test" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-06e1be3b0785e4cc0"
}

resource "aws_alb_listener" "test" {
  protocol = "HTTP"
  port = "80"
  load_balancer_arn = "${aws_alb.test.arn}"
  default_action {
    target_group_arn = "${aws_alb_target_group.test.arn}"
    type = "forward"
  }
}

resource "aws_autoscaling_attachment" "test" {
  autoscaling_group_name = "${aws_autoscaling_group.asg-1.id}"
  alb_target_group_arn   = "${aws_alb_target_group.test.arn}"
}
