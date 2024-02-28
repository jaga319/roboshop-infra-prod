variable "common_tags" {
    type = map
    default = {
        Project="roboshop"
        environment="prod"
        terraform="true"
    }
}

variable "sg_tags" {
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
variable "sg_name" {
    default = ""
  
}
variable "mongodb_sg_ingress_rules" {
      default = [
         {
            description      = "Allow port 80"
            from_port        = 80
            to_port          = 80
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]      },
        {
            description      = "Allow port 443"
            from_port        = 443
            to_port          = 443
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]      }
      ]
}