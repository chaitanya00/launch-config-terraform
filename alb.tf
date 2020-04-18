resource "aws_alb" "test" {
  name               = "alb-lc"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-09dd5038646930bea"]
  subnets            = ["subnet-0359529ae722009ee","subnet-0af7fd9769f8bb031"]

  enable_deletion_protection = true

  tags = {
    Name = "alb-lc"
  }
}


