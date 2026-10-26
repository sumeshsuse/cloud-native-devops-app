terraform {
  
  backend "s3" {
    bucket         = "suse-cloud-native-s3"
    key            = "cloud-native-devops-app/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "suse-cloud-native-app"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
       tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source       = "../../modules/vpc"
  environment  = var.environment
  cluster_name = var.cluster_name
}

module "eks_cluster" {
  source              = "../../modules/eks-cluster"
  cluster_name        = var.cluster_name
  vpc_id              = module.vpc.vpc_id
  public_subnet_ids   = module.vpc.public_subnet_ids
  private_subnet_ids  = module.vpc.private_subnet_ids
}


data "tls_certificate" "eks_oidc" {
  url = module.eks_cluster.cluster_oidc_issuer_url
}

resource "aws_iam_openid_connect_provider" "eks" {
  url             = module.eks_cluster.cluster_oidc_issuer_url
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks_oidc.certificates[0].sha1_fingerprint]
}

module "irsa_alb_controller" {
  source             = "../../modules/irsa-alb-controller"
  cluster_name       = var.cluster_name
  oidc_provider_arn  = aws_iam_openid_connect_provider.eks.arn
  oidc_provider_url  = replace(aws_iam_openid_connect_provider.eks.url, "https://", "")
}

module "irsa_github_actions" {
  source        = "../../modules/irsa-github-actions"
  cluster_name  = var.cluster_name
  github_org    = var.github_org
  github_repo   = var.github_repo
  github_branch = var.github_branch
}