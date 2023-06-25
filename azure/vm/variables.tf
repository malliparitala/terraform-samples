variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed."
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine."
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to attach the virtual machine."
  type        = string
}

variable "image_publisher" {
  description = "Publisher of the virtual machine image."
  type        = string
}

variable "image_offer" {
  description = "Offer of the virtual machine image."
  type        = string
}

variable "image_sku" {
  description = "SKU of the virtual machine image."
  type        = string
}

variable "admin_username" {
  description = "Admin username for the virtual machine."
  type        = string
}

variable "admin_password" {
  description = "Admin password for the virtual machine."
  type        = string
}

variable "min_capacity" {
  description = "Minimum number of instances in the auto scaling group."
  type        = number
}

variable "max_capacity" {
  description = "Maximum number of instances in the auto scaling group."
  type        = number
}

variable "cpu_threshold" {
  description = "CPU threshold percentage for triggering auto scaling."
  type        = number
}

variable "upgrade_policy_mode" {
  description = "The upgrade policy mode for the virtual machine scale set."
  type        = string
}