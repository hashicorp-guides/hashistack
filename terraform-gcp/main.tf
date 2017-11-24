# Set environment name
resource "random_id" "environment_name" {
  byte_length = 4
  prefix      = "${var.environment_name_prefix}-"
}

provider "google" {
  region     = "${var.gcp_region}"
}

module "network-gcp" {
  source           = "git::ssh://git@github.com/hashicorp-modules/network-aws?ref=0.1.0"
  environment_name = "${random_id.environment_name.hex}"
  os               = "${var.os}"
  os_version       = "${var.os_version}"
  ssh_key_data     = "${module.ssh-keypair-data.public_key_data}"
}

module "hashistack-aws" {
  source           = "git::ssh://git@github.com/hashicorp-modules/hashistack-aws?ref=ami_filter"
  environment_name = "${random_id.environment_name.hex}"
  cluster_name     = "${random_id.environment_name.hex}"
  cluster_size     = "${var.cluster_size}"
  os               = "${var.os}"
  os_version       = "${var.os_version}"
  ssh_key_data     = "${module.ssh-keypair-data.public_key_data}"
  subnet_ids       = "${module.network-aws.subnet_private_ids}"
  vpc_id           = "${module.network-aws.vpc_id}"
  instance_type    = "${var.instance_type}"
}

module "ssh-keypair-data" {
  source       = "git::git@github.com:hashicorp-modules/ssh-keypair-data.git"
  private_key_filename = "${random_id.environment_name.hex}"
}
