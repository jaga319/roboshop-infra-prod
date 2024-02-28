module "roboshop" {
    source = "git::https://github.com/jaga319/teraform-aws-vpc.git?ref=main"
    # source = "git::https://github.com/daws-76s/terraform-aws-vpc.git?ref=main"

    project_name = var.project_name
    environment = var.environment
    common_tags = var.common_tags
    vpc_tags = var.vpc_tags
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    database_subnet_cidr = var.database_subnet_cidr
    is_peering_required = var.is_peering_required
}