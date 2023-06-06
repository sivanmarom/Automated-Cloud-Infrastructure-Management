variable "load_balancer_name" {
  type    = string
  default = "production-load-balancer"
}

variable "target_group_name" {
  type    = string
  default = "production-target-group"
}

variable "target_group_port" {
  type    = number
  default = 80
}

variable "target_group_protocol" {
  type    = string
  default = "HTTP"
}

variable "vpc_id" {
  type    = string
  default = "vpc-05beb2b3e64cc2c75"  
}

variable "security_group" {
  type = string
  default = "sg-03915679baa198009"
}

variable "subnets" {
  type = list(string)
  default = [ "subnet-0950fcd396ff7984e","subnet-0816347f6f77da266","subnet-0c04c4c76e62a996e","subnet-0284211308afcc97d","subnet-0e287e27d1d7ca185","subnet-0a8f7034ba7a7730c"]
}


variable "production_instance_ids" {
  type    = list(string)
  default = []
}

