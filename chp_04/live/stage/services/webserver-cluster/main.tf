provider "aws" {
  region = var.region
}

module "webserver_cluster" {
  source = "github.com/mjsydney23/terraform-modules//services/webserver-cluster?ref=v0.0.2"

  cluster_name           = "webserver-stage"
  db_remote_state_bucket = "mjsydney23-terraform-state"
  db_remote_state_key    = "stage/data-store/postgresql/terraform.tfstate"
  instance_type          = "t2.micro"
  min_size               = 2
  max_size               = 2
}

# overwrite secutiry group rule defined in the module
# resource "aws_security_group_rule" "testing" {
#   type              = "ingress"
#   security_group_id = module.webserver_cluster.alb_security_group_id

#   from_port   = ""
#   to_port     = ""
#   protocol    = "tcp"
#   cidr_blocks = ["0.0.0.0/0"]
# }
