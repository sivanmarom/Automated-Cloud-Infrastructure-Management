resource "aws_instance" "myec2" {
  count         = length(var.instances_name)
  instance_type = var.instnace_type
  ami           = var.instance_ami
  tags = {
    Name = var.instances_name[count.index]
  }
}
