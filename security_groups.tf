resource "aws_security_group" "tig_dev" {
  name        = "tig-dev"
  description = "Allow SSH inbound, all HTTP inbound on port 3000, and all outbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.management_cidr_block]
  }

  # These hardcoded values come from the Terraform Cloud API described at https://www.terraform.io/docs/cloud/api/ip-ranges.html so the provisioner blocks can run
  # These may be subject to change

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}