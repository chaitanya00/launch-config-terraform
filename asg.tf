resource "aws_autoscaling_group" "asg-1" {
  name                 = "asg"
  launch_configuration = "${aws_launch_configuration.lc1.name}"
  min_size             = 1
  max_size             = 3
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 1
  vpc_zone_identifier = ["subnet-08f6df21dce1135d3","subnet-01b919307a1867fe4"]
  tag {
    key                 = "Name"
    value               = "asg"
     propagate_at_launch = true  
  }  
  lifecycle {
    create_before_destroy = true
  }
}
