variable "main_region" {
  default = "us-east-1"
}

variable "subnet_fe_id" {
  default = module.vpc.subnet_fe_id
}

variable "subnet_be_id" {
  default = module.vpc.subnet_be_id
}

variable "subnet_db_id" {
  default = module.vpc.subnet_db_id
}