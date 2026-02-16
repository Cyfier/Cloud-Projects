resource "aws_security_group" "app_sg" {
  name        = "app-sg"
  description = "Allow ALB to reach App tier"
  vpc_id      = aws_vpc.MultiCloud.id
}

resource "aws_security_group_rule" "app_allow_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.app_sg.id
  source_security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "app_allow_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.app_sg.id
  source_security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group" "prod_sg" {
  name        = "prod-sg"
  description = "No inbound internet"
  vpc_id      = aws_vpc.MultiCloud.id
}

resource "aws_security_group" "data_sg" {
  name        = "data-sg"
  description = "Allow App/Prod to reach Data"
  vpc_id      = aws_vpc.MultiCloud.id
}

resource "aws_security_group_rule" "data_allow_app" {
  type                     = "ingress"
  from_port                = 1433
  to_port                  = 1433
  protocol                 = "tcp"
  security_group_id        = aws_security_group.data_sg.id
  source_security_group_id = aws_security_group.app_sg.id
}

resource "aws_security_group_rule" "data_allow_prod" {
  type                     = "ingress"
  from_port                = 1433
  to_port                  = 1433
  protocol                 = "tcp"
  security_group_id        = aws_security_group.data_sg.id
  source_security_group_id = aws_security_group.prod_sg.id
}

resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Security group for ALB"
  vpc_id      = aws_vpc.MultiCloud.id
}