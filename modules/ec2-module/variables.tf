variable "instnace_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_ami" {
  type    = string
  default = "ami-0aa2b7722dc1b5612"
}

variable "instances_name" {
  type    = list(string)
  default = ["Jenkins_master", "Testing", "Production-1", "Production-2"]
}
