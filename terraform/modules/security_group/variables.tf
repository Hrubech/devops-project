variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}

variable "vpc_id" {}
variable "security_groups_name" {}
variable "security_groups_ports" {}
variable "protocol" {}