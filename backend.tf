terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "excelsior"

    workspaces {
      name = "aws-ubuntu-tig-dev"
    }
  }
}
