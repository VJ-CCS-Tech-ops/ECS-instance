resource "aws_ecr_repository" "ecr" {
  name = "${var.ecr-name}"

tags {
  Name = "dev"

 }
}

output "repo-url" {
 value = "${aws_ecr_repository.ecr.repository_url}"
}
