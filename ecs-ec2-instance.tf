###########################################################
# AWS ECS-EC2
###########################################################
resource "aws_instance" "ec2_instance" {
  ami                    = "ami-08935252a36e25f85"
  subnet_id              =  "${aws_subnet.pub_subnet.id}"
  instance_type          = "t2.medium"
  iam_instance_profile   = "${aws_iam_instance_profile.ecs-instance-profile.name}"
  # vpc_security_group_ids = ["sg-01849003c4f9203ca"]
  key_name               = "pnl-test"
  ebs_optimized          = "false"
  source_dest_check      = "false"
  user_data              = "${data.template_file.user_data.rendered}"
  root_block_device = {
    volume_type           = "gp2"
    volume_size           = "30"
    delete_on_termination = "true"
  }

  tags {
    Name                   = "dev"
}

  lifecycle {
    ignore_changes         = ["ami", "user_data", "subnet_id", "key_name", "ebs_optimized", "private_ip"]
  }
}

data "template_file" "user_data" {
  template = "${file("${path.module}/user_data.tpl")}"
}
