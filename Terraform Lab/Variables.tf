variable "prefix" {
  type        = string
  description = "Prefix for all resources"
}

variable "location" {
  type        = string
  default     = "eastus"
}

variable "environment" {
  type        = string
  default     = "dev"
}

variable "owner" {
  type        = string
}

variable "costcenter" {
  type        = string
  default     = "IT"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID to deploy resources into"
}
