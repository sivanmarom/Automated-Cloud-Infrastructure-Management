provider "aws" {
  region = "us-east-1"
}

resource "aws_lb" "load_balancer" {
  name               = var.load_balancer_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group]
  subnets            = var.subnets
  count              = 1
}
resource "aws_lb_target_group" "target_group" {
  name        = var.target_group_name
  port        = var.target_group_port
  protocol    = var.target_group_protocol
  target_type = var.target_type
  vpc_id      = var.vpc_id
}
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.load_balancer[0].arn
  port              = var.target_group_port
  protocol          = var.target_group_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}



resource "aws_lb_target_group_attachment" "attachments" {
  count            = length(var.instances_public_ips)
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = element([for ip in var.instances_public_ips : "${ip}:${var.target_group_port}"], count.index)
}
