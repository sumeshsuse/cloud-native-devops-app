variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.1.0.0/16"
}

variable "environment" {
  type        = string
  description = "environment name, used in tags"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name, needed for subnet tagging"
}