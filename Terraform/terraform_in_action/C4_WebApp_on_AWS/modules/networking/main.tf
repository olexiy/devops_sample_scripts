data "aws_availability_zones" "available" {}

module "vpc" {
    source                      = "terraform-aws-modules/vpc/aws"
    version                     = "2.64.0"
    namespace                   = "${var.namespace}-vpc"
    cidr                        = "10.0.0.0/16"
    azs                         = "data.aws_availability_zones.available.names"
    private_subnets             = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    public_subnets              = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
    database_subnets            = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
    crate_database_subnet_group = true
    enable_nat_gateway          = true
    single_nat_gateway          = true
}

module "lb_sg" {
    source      = "terraform_in_action/sg/aws" 
    vpc_id      = module.vpc.vpc_id
    ingress_rules = [{
        port        = 80
        cidr_blocks = ["0.0.0.0/0"]
    }] 
}

module "webserver_sg" {
    source      = "terraform_in_action/sg/aws"
    vpc_id      = module.vpc.vpc_id
    ingress_rules = [
        {
            port        = 8080
            security_groups = [module.lb_sg.sequrity_group_id]
        },
        {
            port        = 22
            cidr_blocks = ["10.0.0.0/16"]
        }
    ]

}