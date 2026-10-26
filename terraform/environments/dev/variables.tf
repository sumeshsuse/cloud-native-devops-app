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

variable "github_org_id" {
  type        = string
  description = "numeric GitHub account ID used in the OIDC subject"
}

variable "github_repo_id" {
  type        = string
  description = "numeric GitHub repository ID used in the OIDC subject"
}

variable "state_bucket" {
  type = string
}

variable "state_key_prefix" {
  type = string
}

variable "lock_table" {
  type = string
}