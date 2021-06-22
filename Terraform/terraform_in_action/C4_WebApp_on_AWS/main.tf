module "autoscaling" {
    source          = "./modules/autoscaling"
    namespace       = var.namespace
    ssh_keypair     = var.ssh_keypair

    vpc             = module.networking.vpc
    sg              = module.networking.db_sg
    db_config       = module.database.db_config
}

module "database"{
    source      = "./modules/database"
    namespace   = var.namespace
}

module "networking" {
    source      = "./modules/networking"
    namespace   = var.namespace
}