data "terraform_remote_state" "ec2_instance" {
  backend = "local"

  config = {
    path = "../ec2-module/terraform.tfstate"
  }
}
#need to check if i need this saving output
resource "local_file" "save_output" {
  filename = "output.txt"
  content  = join(",", data.terraform_remote_state.ec2_instance.outputs.instance_ids)
}

resource "aws_lb" "load_balancer" {
  name               = var.load_balancer_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group]
  subnets            = var.subnets
  count              = length(data.terraform_remote_state.ec2_instance.outputs.instance_ids)
}

resource "aws_lb_target_group" "target_group" {
  name     = var.target_group_name
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.load_balancer[count.index].arn
  port              = var.target_group_port
  protocol          = var.target_group_protocol

  default_action {
    target_group_arn = aws_lb_target_group.target_group.arn
    type             = "forward"
  }

  count = length(data.terraform_remote_state.ec2_instance.outputs.instance_ids)
}

resource "aws_lb_target_group_attachment" "target_group_attachment" {
  count            = length(data.terraform_remote_state.ec2_instance.outputs.instance_ids)
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = data.terraform_remote_state.ec2_instance.outputs.instance_ids[count.index]
  port             = var.target_group_port
}
