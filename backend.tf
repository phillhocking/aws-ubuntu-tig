terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "phillhocking"

    workspaces {
      name = "aws-ubuntu-tig-prod"
    }
  }
}
