variable "project_name" {
  description = "Name of the infrastructure project"
  type        = string
  default     = "automated-azure"
}

variable "location" {
  description = "Azure deployment region"
  type        = string
  default     = "Central India"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
variable "storage_account_name" {
  description = "Globally unique Azure Storage Account name"
  type        = string

  validation {
    condition = (
      length(var.storage_account_name) >= 3 &&
      length(var.storage_account_name) <= 24 &&
      can(regex("^[a-z0-9]+$", var.storage_account_name))
    )
    error_message = "Storage Account name must contain 3-24 lowercase letters or numbers only."
  }
}
