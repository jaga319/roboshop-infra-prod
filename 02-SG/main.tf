module "VPN" {
     source = "git::https://github.com/jaga319/terraform-aws-sg.git?ref=main"
     project_name= "VPN"
     environment="DEV"
     vpc_id=data.aws_vpc.default.id
     sg_name="VPN"
     sg_description = "SG for VPN"
    #  sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "mongodb" {
     source = "git::https://github.com/jaga319/terraform-aws-sg.git?ref=main"
     project_name=var.project_name
     environment=var.environment
     vpc_id=data.aws_ssm_parameter.vpc_id.value
     sg_name="mongodb"
     sg_description = "SG for mongodb"
    #  sg_ingress_rules = var.mongodb_sg_ingress_rules
}
module "redis" {
     source = "git::https://github.com/jaga319/terraform-aws-sg.git?ref=main"
     project_name=var.project_name
     environment=var.environment
     vpc_id=data.aws_ssm_parameter.vpc_id.value
     sg_name="redis"
     sg_description = "SG for redis"
    #  sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "mysql" {
     source = "git::https://github.com/jaga319/terraform-aws-sg.git?ref=main"
     project_name=var.project_name
     environment=var.environment
     vpc_id=data.aws_ssm_parameter.vpc_id.value
     sg_name="mysql"
     sg_description = "SG for mysql"
    #  sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "rabbitmq" {
     source = "git::https://github.com/jaga319/terraform-aws-sg.git?ref=main"
     project_name=var.project_name
     environment=var.environment
     vpc_id=data.aws_ssm_parameter.vpc_id.value
     sg_name="rabbitmq"
     sg_description = "SG for rabbitmq"
    #  sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "catalogue" {
     source = "git::https://github.com/jaga319/terraform-aws-sg.git?ref=main"
     project_name=var.project_name
     environment=var.environment
     vpc_id=data.aws_ssm_parameter.vpc_id.value
     sg_name="catalogue"
     sg_description = "SG for catalogue"
    #  sg_ingress_rules = var.mongodb_sg_ingress_rules
}


module "user" {
     source = "git::https://github.com/jaga319/terraform-aws-sg.git?ref=main"
     project_name=var.project_name
     environment=var.environment
     vpc_id=data.aws_ssm_parameter.vpc_id.value
     sg_name="user"
     sg_description = "SG for user"
    #  sg_ingress_rules = var.mongodb_sg_ingress_rules
}
module "cart" {
     source = "git::https://github.com/jaga319/terraform-aws-sg.git?ref=main"
     project_name=var.project_name
     environment=var.environment
     vpc_id=data.aws_ssm_parameter.vpc_id.value
     sg_name="cart"
     sg_description = "SG for cart"
    #  sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "shipping" {
     source = "git::https://github.com/jaga319/terraform-aws-sg.git?ref=main"
     project_name=var.project_name
     environment=var.environment
     vpc_id=data.aws_ssm_parameter.vpc_id.value
     sg_name="shipping"
     sg_description = "SG for shipping"
    #  sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "payment" {
     source = "git::https://github.com/jaga319/terraform-aws-sg.git?ref=main"
     project_name=var.project_name
     environment=var.environment
     vpc_id=data.aws_ssm_parameter.vpc_id.value
     sg_name="payment"
     sg_description = "SG for payment"
    #  sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "web" {
     source = "git::https://github.com/jaga319/terraform-aws-sg.git?ref=main"
     project_name=var.project_name
     environment=var.environment
     vpc_id=data.aws_ssm_parameter.vpc_id.value
     sg_name="web"
     sg_description = "SG for web"
    #  sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "app_alb" {

     source = "git::https://github.com/jaga319/terraform-aws-sg.git?ref=main"
     project_name=var.project_name
     environment=var.environment
     vpc_id=data.aws_ssm_parameter.vpc_id.value
     sg_name="app-alb"
     sg_description = "SG for APP ALB"
    #  sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "web_alb" {
     source = "git::https://github.com/jaga319/terraform-aws-sg.git?ref=main"
     project_name=var.project_name
     environment=var.environment
     vpc_id=data.aws_ssm_parameter.vpc_id.value
     sg_name="web-alb"
     sg_description = "SG for web ALB"
    #  sg_ingress_rules = var.mongodb_sg_ingress_rules
}


#APP ALB should accept connections only from VPN , since it it internal .
resource "aws_security_group_rule" "app_alb_vpn" {
  source_security_group_id = module.VPN.sg_id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.app_alb.sg_id

}
resource "aws_security_group_rule" "app_alb_web" {
  source_security_group_id = module.web.sg_id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.app_alb.sg_id

}

resource "aws_security_group_rule" "app_alb_catalogue" {
  source_security_group_id = module.catalogue.sg_id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.app_alb.sg_id

}
resource "aws_security_group_rule" "app_alb_cart" {
  source_security_group_id = module.cart.sg_id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.app_alb.sg_id

}
resource "aws_security_group_rule" "app_alb_user" {
  source_security_group_id = module.user.sg_id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.app_alb.sg_id

}
resource "aws_security_group_rule" "app_alb_shipping" {
  source_security_group_id = module.shipping.sg_id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.app_alb.sg_id

}
resource "aws_security_group_rule" "app_alb_payment" {
  source_security_group_id = module.payment.sg_id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.app_alb.sg_id

}




# 443 we need to create certificate 

resource "aws_security_group_rule" "web_alb_internet" {
  cidr_blocks = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = module.web_alb.sg_id

}



resource "aws_security_group_rule" "VPN_HOME" {
  security_group_id = module.VPN.sg_id
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}



resource "aws_security_group_rule" "vpn_mongodb" {
  source_security_group_id = module.VPN.sg_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id
}

resource "aws_security_group_rule" "mongodb_catalogue" {
  source_security_group_id = module.catalogue.sg_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id



}

resource "aws_security_group_rule" "mongodb_user" {
  source_security_group_id = module.user.sg_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb.sg_id
}

resource "aws_security_group_rule" "redis_user" {
  source_security_group_id = module.user.sg_id
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis.sg_id
}

resource "aws_security_group_rule" "redis_vpn" {
  source_security_group_id = module.VPN.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.redis.sg_id
}

resource "aws_security_group_rule" "redis_cart" {
  source_security_group_id = module.cart.sg_id
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis.sg_id
}

resource "aws_security_group_rule" "mysql_vpn" {
  source_security_group_id = module.VPN.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.mysql.sg_id
}

resource "aws_security_group_rule" "mysql_shipping" {
  source_security_group_id = module.shipping.sg_id
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = module.mysql.sg_id
}


resource "aws_security_group_rule" "rabbitmq_vpn" {
  source_security_group_id = module.VPN.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.rabbitmq.sg_id
}

resource "aws_security_group_rule" "rabbitmq_payment" {
  source_security_group_id = module.payment.sg_id
  type                     = "ingress"
  from_port                = 5672
  to_port                  = 5672
  protocol                 = "tcp"
  security_group_id        = module.rabbitmq.sg_id
}

resource "aws_security_group_rule" "catalogue_vpn" {
  source_security_group_id = module.VPN.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.catalogue.sg_id
}
resource "aws_security_group_rule" "catalogue_vpn_http" {
  source_security_group_id = module.VPN.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.catalogue.sg_id
}

resource "aws_security_group_rule" "catalogue_web" {
  source_security_group_id = module.web.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.catalogue.sg_id
}

resource "aws_security_group_rule" "catalogue_app_alb" {
  source_security_group_id = module.app_alb.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.catalogue.sg_id
}

# resource "aws_security_group_rule" "catalogue_cart" {
#   source_security_group_id = module.cart.sg_id
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = module.catalogue.sg_id
# }

resource "aws_security_group_rule" "user_vpn" {
  source_security_group_id = module.VPN.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.user.sg_id
}

resource "aws_security_group_rule" "user_app_alb" {
  source_security_group_id = module.app_alb.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.user.sg_id
}

# resource "aws_security_group_rule" "user_web" {
#   source_security_group_id = module.web.sg_id
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = module.user.sg_id
# }

# resource "aws_security_group_rule" "user_payment" {
#   source_security_group_id = module.payment.sg_id
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = module.user.sg_id
# }

resource "aws_security_group_rule" "cart_vpn" {
  source_security_group_id = module.VPN.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.cart.sg_id
}

# resource "aws_security_group_rule" "cart_web" {
#   source_security_group_id = module.web.sg_id
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = module.cart.sg_id
# }

resource "aws_security_group_rule" "alb_cart" {
  source_security_group_id = module.app_alb.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.cart.sg_id
}

resource "aws_security_group_rule" "cart_shipping" {
  source_security_group_id = module.shipping.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.cart.sg_id
}

resource "aws_security_group_rule" "cart_payment" {
  source_security_group_id = module.payment.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.cart.sg_id
}

resource "aws_security_group_rule" "shipping_vpn" {
  source_security_group_id = module.VPN.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.shipping.sg_id
}

# resource "aws_security_group_rule" "shipping_web" {
#   source_security_group_id = module.web.sg_id
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = module.shipping.sg_id
# }

resource "aws_security_group_rule" "shipping_alb" {
  source_security_group_id = module.app_alb.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.shipping.sg_id
}

resource "aws_security_group_rule" "payment_vpn" {
  source_security_group_id = module.VPN.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.payment.sg_id
}

# resource "aws_security_group_rule" "payment_web" {
#   source_security_group_id = module.web.sg_id
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = module.payment.sg_id
# }

resource "aws_security_group_rule" "payment_alb" {
  source_security_group_id = module.app_alb.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.payment.sg_id
}

resource "aws_security_group_rule" "web_vpn" {
  source_security_group_id = module.VPN.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.web.sg_id
}

resource "aws_security_group_rule" "web_internet" {
  cidr_blocks = ["0.0.0.0/0"]
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.web.sg_id
}