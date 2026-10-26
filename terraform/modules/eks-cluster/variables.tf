variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version for the EKS control plane"
  default     = "1.31"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the cluster will run"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "public subnet IDs, needed by the control plane's networking"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "private subnet IDs, where worker nodes will run"
}

variable "node_instance_types" {
  type        = list(string)
  description = "EC2 instance types for worker nodes"
  default     = ["t3.medium"]
}

variable "node_desired_size" {
  type        = number
  default     = 2
}

variable "node_max_size" {
  type        = number
  default     = 2
}

variable "node_min_size" {
  type        = number
  default     = 1
}