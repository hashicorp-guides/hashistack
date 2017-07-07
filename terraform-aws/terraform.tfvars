# Environment Name (tagged to all instances)
environment_name = "production"

# Region (us-west-1 alone has the hashistack AMIs for certain as of 7/7/17)
region = "us-west-1"

# Operating System to use ie RHEL or Ubuntu
# os = "Ubuntu"
os = "RHEL"

# Operating System version to use ie 7.3 (for RHEL) or 16.04 (for Ubuntu)
# os_version = "16.04"
os_version = "7.3"

# Product versions to use (requires matching AMI)
consul_version = "0.8.4"
nomad_version  = "0.5.6"
vault_version  = "0.7.3"
