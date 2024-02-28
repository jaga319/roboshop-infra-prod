variable "cidr_block" {
    type = string
    default = "10.1.0.0/16"  # users can override
  
}
variable "common_tags" {
    type = map
    default = {
        Project="roboshop"
        environment="prod"
        terraform="true"
    }
}

variable "vpc_tags" {
    type = map
    default = {
        
    }
}

variable "project_name" {

    type = string
    default = "roboshop"
  
}
variable "environment" {
    type = string
    default = "prod"
}

variable "public_subnet_cidr" {
    default = ["10.1.1.0/24","10.1.2.0/24"]
}
variable "private_subnet_cidr" {
    default = ["10.1.11.0/24","10.1.12.0/24"]
}

variable "database_subnet_cidr" {
    default = ["10.1.21.0/24","10.1.22.0/24"]
  
}

variable "is_peering_required" {
   default = true
}