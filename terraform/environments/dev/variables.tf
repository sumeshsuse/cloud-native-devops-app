variable "environment" {
  type        = string
  description = "environment name"
  default     = "dev"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
  default     = "suse-eks-dev"
}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "github_org" {
  type        = string
  description = "GitHub organization or username"
}

variable "github_repo" {
  type        = string
  description = "repository name"
}

variable "github_branch" {
  type        = string
  description = "branch allowed to assume the deploy role"
  default     = "main"
}