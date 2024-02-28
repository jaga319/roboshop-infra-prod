variable "common_tags" {
    type = map
    default = {
        Project="roboshop"
        environment="dev"
        terraform="true"
    }
}
variable "tags" {
    default = {
        Component="web"
    }
  
}
variable "project_name" {

    type = string
    default = "roboshop"
  
}
variable "environment" {
    type = string
    default = "dev"
}

variable "zone_name" {
    default = "infome.website"
  
}