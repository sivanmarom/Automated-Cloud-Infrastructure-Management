provider "aws" {
  region = "us-east-1"
}
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
      "sudo apt -y install default-jre",
      " wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg",
      "echo \"deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $$(lsb_release -cs) main\" | sudo tee /etc/apt/sources.list.d/hashicorp.list",
      "sudo apt update && sudo apt install terraform"
    ]
  }
}
