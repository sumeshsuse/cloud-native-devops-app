output "cluster_name" {
  value = module.eks_cluster.cluster_name
}

output "cluster_endpoint" {
  value = module.eks_cluster.cluster_endpoint
}

output "cluster_oidc_issuer_url" {
  value = module.eks_cluster.cluster_oidc_issuer_url
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "alb_controller_role_arn" {
  value = module.irsa_alb_controller.role_arn
}

output "github_actions_role_arn" {
  value = module.irsa_github_actions.role_arn
}

output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.eks.arn
}