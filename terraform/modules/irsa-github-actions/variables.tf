variable "cluster_name" {
  type = string
}

variable "github_org" {
  type        = string
  description = "GitHub organization or username"
}

variable "github_repo" {
  type        = string
  description = "repository name, e.g. suse-project"
}

variable "github_branch" {
  type        = string
  description = "branch allowed to assume this role"
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