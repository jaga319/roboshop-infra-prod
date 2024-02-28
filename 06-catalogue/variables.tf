variable "common_tags" {
    type = map
    default = {
        Project="roboshop"
        environment="prod"
        terraform="true"
    }
}
variable "tags" {
    default = {
        Component="catalogue"
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
variable "zone_name" {

    default = "infome.website"
  
}