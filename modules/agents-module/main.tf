resource "aws_instance" "ec2-agents" {
  count         = length(var.instances_name)
  ami           = var.instance_ami
  instance_type = var.instnace_type
  key_name      = "terraform_key"

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("${path.module}/terraform_key.pem")
    timeout     = "10m"
  }

  tags = {
    Name = var.instances_name[count.index]
  }
    provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt -y install docker.io",
      "sudo apt -y install default-jre",
    ]
  }
}
