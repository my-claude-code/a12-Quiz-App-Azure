variable "subscription_id" {
  description = "Azure subscription ID — provide in terraform.tfvars (gitignored)"
  type        = string
}

variable "entra_client_secret" {
  description = "Microsoft Entra app client secret — provide in terraform.tfvars (gitignored)"
  type        = string
  sensitive   = true
}

variable "entra_tenant_id" {
  description = "Microsoft Entra tenant ID — provide in terraform.tfvars (gitignored)"
  type        = string
}

variable "entra_client_id" {
  description = "Microsoft Entra app client ID — provide in terraform.tfvars (gitignored)"
  type        = string
}

variable "admin_username" {
  description = "VM admin username — provide in terraform.tfvars"
  type        = string
}

variable "admin_password" {
  description = "VM admin password — provide in terraform.tfvars (gitignored)"
  type        = string
  sensitive   = true
}

variable "flask_secret_key" {
  description = "Flask secret key — provide in terraform.tfvars (gitignored)"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "PostgreSQL quizadmin password — provide in terraform.tfvars (gitignored)"
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "West Europe"
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_B2s"
}

variable "github_repo" {
  description = "GitHub repo URL to clone the app from"
  type        = string
  default     = "https://github.com/my-claude-code/a11-Quiz-App-PostgreSQL.git"
}
