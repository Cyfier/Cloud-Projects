resource "aws_lb" "public_alb" {
  name               = "public-alb"
  load_balancer_type = "application"
  subnets            = [aws_subnet.app.id]
  security_groups    = [aws_security_group.alb_sg.id]
}

resource "aws_lb_target_group" "app_tg" {
  name     = "app-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.MultiCloud.id
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.public_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}