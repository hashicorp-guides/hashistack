# Optional variables
variable "environment_name_prefix" {
  default     = "hashistack"
  description = "Environment Name prefix eg my-hashistack-env"
}

# Required variables for hashistack-aws config
variable "os" {
  # case sensitive for AMI lookup
  description = "Operating System to use ie RHEL or Ubuntu"
}

variable "os_version" {
  description = "Operating System version to use ie 7.3 (for RHEL) or 16.04 (for Ubuntu)"
}

# Optional variables for the hashistack-aws repo
variable "cluster_size" {
  default     = "3"
  description = "Number of instances to launch in the cluster"
}

variable "consul_version" {
  default     = "0.8.4"
  description = "Consul version to use ie 0.8.4"
}

variable "nomad_version" {
  default     = "0.5.6"
  description = "Nomad version to use ie 0.5.6"
}

variable "vault_version" {
  default     = "0.7.3"
  description = "Vault version to use ie 0.7.1"
}

variable "instance_type" {
  default     = "m4.large"
  description = "AWS instance type to use eg m4.large"
}

variable "region" {
  default     = "us-west-1"
  description = "Region to deploy consul cluster ie us-west-1"
}
