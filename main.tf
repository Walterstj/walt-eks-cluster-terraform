terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
#  region = "us-east-1"
#  access_key = var.access_key
#  secret_key = var.secret_key

profile = "eks-user"

}

data "aws_availability_zones" "a_zones" {
  state = "available"

}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token

}