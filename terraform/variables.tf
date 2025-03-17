variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}


variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  default     = ["10.0.1.0/24"]
}

# variable "subnet_id" {}

# variable "security_groups_name" {}
variable "security_groups_ports" {}
variable "protocol" {}

# variable "instance_name" {}
variable "instance_type" {}
variable "security_group_id" {}
variable "security_groups_name" {}
variable "username" {}
# variable "private_key_path" {}
# variable "ami" {}
# variable "key_name" {}

# variable "filename" {}
# variable "key_name" {}

variable "region" {}

variable "stack" {}