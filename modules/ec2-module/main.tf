
resource "aws_instance" "jenkins_master" {
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
    Name = var.instances_name[0]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt -y install docker.io",
      "sudo apt -y install default-jre",
      "sudo docker run --name jenkins_master -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts",
    ]
  }
}

resource "aws_instance" "testing_slave" {
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
    Name = var.instances_name[1]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt -y install docker.io",
      "sudo apt -y install default-jre",
    ]
  }
}

resource "aws_instance" "production1" {
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
    Name = var.instances_name[1]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt -y install docker.io",
      "sudo apt -y install default-jre",
    ]
  }
}


resource "aws_instance" "production2" {
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
    Name = var.instances_name[2]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt -y install docker.io",
      "sudo apt -y install default-jre",
    ]
  }
}
