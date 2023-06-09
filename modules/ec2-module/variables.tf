variable "instnace_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_ami" {
  type    = string
  default = "ami-0aa2b7722dc1b5612"
}

variable "production_instances" {
  type    = list(string)
  default = [  "Production-1", "Production-2"]
}
variable "testing_instance" {
  type    = string
  default = "Testing"
}
variable "jenkisn_master_instance" {
  type    = string
  default = "Jenkins_master"
}
variable "security_group" {
  type = string
  default = "sg-03915679baa198009"
}

