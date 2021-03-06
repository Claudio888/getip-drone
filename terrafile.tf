provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-modulo"
    key    = "terraform-modulo.tfstate"
    region = "us-east-1"
  }
}

module "instancia" {
  source = "github.com/Claudio888/terraform2pipeline.git?ref=1.0"
  name = "Get-IP-iac"
  enable_sg = true
  env_prefix = "dev"
  ingress_ports = [22,8090]
}

output "ip_address" {
  value = module.instancia.ip_address
}
