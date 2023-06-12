provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "jenkins_master" {
  ami                    = var.instance_ami
  instance_type          = var.instnace_type
  key_name               = "project_3"
  vpc_security_group_ids = [var.security_group]

  user_data = <<-EOT
    #!/bin/bash
    sudo apt update -y
    sudo apt -y install docker.io
    sudo apt -y install openjdk-8-jre
    sudo docker run --name jenkins_master -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
    EOT

  tags = {
    Name = var.jenkisn_master_instance
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "testing" {
  ami                    = var.instance_ami
  instance_type          = var.instnace_type
  key_name               = "project_3"
  vpc_security_group_ids = [var.security_group]

  user_data = <<-EOT
    #!/bin/bash
    sudo apt update -y
    sudo apt -y install docker.io
    sudo apt -y install openjdk-8-jre
    EOT

  tags = {
    Name = var.testing_instance
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "production" {
  count                  = length(var.production_instances)
  ami                    = var.instance_ami
  instance_type          = var.instnace_type
  key_name               = "project_3"
  vpc_security_group_ids = [var.security_group]

  user_data = <<-EOT
    #!/bin/bash
    sudo apt update -y
    sudo apt -y install docker.io
    sudo apt -y install openjdk-8-jre
    EOT

  tags = {
    Name = var.production_instances[count.index]
  }

  lifecycle {
    create_before_destroy = true
  }
}

output "instance_ids" {
  value = aws_instance.production[*].id
}
output "public_ips" {
  value = aws_instance.production[*].public_ip
}
