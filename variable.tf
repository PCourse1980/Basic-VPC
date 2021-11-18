

variable "vpc_cidr" {
    description = "cidr_block"
    type = string
    default = "10.0.0.0/16"
  
}

variable "public_cidr"{
    description = "public_cidre_block"
    type = string
    default = "10.0.30.0/24"
}

variable "private_cidr"{
    description = "private_cidre_block"
    type = string
    default = "10.0.31.0/24"
}

variable "public_AZ" {
    description = "public_availabilty_zone"
    type = string
    default = "eu-west-2a"
  
}

variable "private_AZ" {
    description = "private_availabilty_zone"
    type = string
    default = "eu-west-2a"
  
}


variable "IGW_destionation_cidr_block" {
    description = "cidr_for_IGW_association"
    type = string
    default = "0.0.0.0/0"
  
}


