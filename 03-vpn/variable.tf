variable "common_tags" {
    type = map
    default = {
        Project="roboshop"
        environment="prod"
        terraform="true"
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
