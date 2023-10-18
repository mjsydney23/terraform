provider "aws" {
  region = var.region
}

module "webserver_cluster" {
  source = "github.com/mjsydney23/terraform-modules//services/webserver-cluster?ref=v0.0.2"

  cluster_name           = "webserver-prod"
  db_remote_state_bucket = "mjsydney23-terraform-state"
  db_remote_state_key    = "prod/data-store/postgresql/terraform.tfstate"
  instance_type          = "t2.micro"
  min_size               = 3
  max_size               = 10
}

# resource "aws_autoscaling_schedule" "scale_out" {
#   scheduled_action_name  = "scale-out"
#   min_size               = 3
#   max_size               = 10
#   desired_capacity       = 5
#   recurrence             = "0 9 * * *"
#   autoscaling_group_name = module.webserver_cluster.asg_name
# }

# resource "aws_autoscaling_schedule" "scale_in" {
#   scheduled_action_name  = "scale-out"
#   min_size               = 3
#   max_size               = 10
#   desired_capacity       = 3
#   recurrence             = "0 17 * * *"
#   autoscaling_group_name = module.webserver_cluster.asg_name
# }
