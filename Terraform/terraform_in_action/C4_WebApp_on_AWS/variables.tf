variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  type        = string
}

variable "ssh_keypair" {
  description = "SSH keypair to use for EC2 instance"
  default     = null
  type        = string
}

variable "region" {
  description = "AWS region"
  default     = "eu-central-1"
  type        = string
}