##########################################################
# AWS ECS-CLUSTER
#########################################################

resource "aws_ecs_cluster" "cluster" {
  name = "${var.ecr-cluster-name}"

  tags {
    Name = "dev"

  }

  }
