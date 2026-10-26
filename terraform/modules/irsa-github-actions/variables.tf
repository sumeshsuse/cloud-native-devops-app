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