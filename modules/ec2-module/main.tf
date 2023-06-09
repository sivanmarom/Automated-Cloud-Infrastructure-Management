

resource "aws_instance" "jenkins_master" {
  ami                    = var.instance_ami
  instance_type          = var.instnace_type
  key_name               = "terraform_key"
  vpc_security_group_ids = [var.security_group]
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("${path.module}/terraform_key.pem")
    timeout     = "10m"
  }

  tags = {
    Name = var.jenkisn_master_instance
  }
  lifecycle {
    create_before_destroy = true
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt -y install docker.io",
      "sudo apt -y install openjdk-8-jre",
      "sudo docker run --name jenkins_master -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts",
    ]
  }
}

resource "aws_instance" "testing" {
  ami                    = var.instance_ami
  instance_type          = var.instnace_type
  key_name               = "terraform_key"
  vpc_security_group_ids = [var.security_group]
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("${path.module}/terraform_key.pem")
    timeout     = "10m"
  }

  tags = {
    Name = var.testing_instance
  }
  lifecycle {
    create_before_destroy = true
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt -y install docker.io",
      "sudo apt -y install openjdk-8-jre",
    ]
  }
}

resource "aws_instance" "production" {
  count                  = length(var.production_instances)
  ami                    = var.instance_ami
  instance_type          = var.instnace_type
  key_name               = "terraform_key"
  vpc_security_group_ids = [var.security_group]
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("${path.module}/terraform_key.pem")
    timeout     = "10m"
  }

  tags = {
    Name = var.production_instances[count.index]
  }
  lifecycle {
    create_before_destroy = true
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt -y install docker.io",
      "sudo apt -y install openjdk-8-jre",
    ]
  }
}


output "instance_ids" {
  value = aws_instance.production[*].id
}
