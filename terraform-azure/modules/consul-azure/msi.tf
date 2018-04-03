resource "azurerm_virtual_machine_extension" "virtual_machine_extension" {
#  count = "${length(var.network_cidrs_private)}"

#  name                 = "${var.consul_datacenter}-${count.index}"
  name                 = "msi"
  location             = "${var.location}"
  resource_group_name  = "${var.resource_group_name}"
  virtual_machine_name = "${element(azurerm_virtual_machine.consul.*.name,count.index)}"
  publisher            = "Microsoft.ManagedIdentity"
  type                 = "ManagedIdentityExtensionForLinux"
  type_handler_version = "1.0"

  settings = <<SETTINGS
    {
        "port": 50342
    }
SETTINGS
}

data "azurerm_subscription" "subscription" {}

data "azurerm_builtin_role_definition" "builtin_role_definition" {
  name = "Contributor"
}

# data "azurerm_role_definition" "role" {}

# Grant the VM identity contributor rights to the current subscription
resource "azurerm_role_assignment" "role_assignment" {
  count = "${length(var.network_cidrs_private)}"
  name               = "azure_ad_identity"
  scope              = "${data.azurerm_subscription.subscription.id}"
  role_definition_id = "${data.azurerm_subscription.subscription.id}${data.azurerm_builtin_role_definition.builtin_role_definition.id}"
#  role_definition_id = "${data.azurerm_role_definition.role.id}"
  principal_id       = "${lookup(azurerm_virtual_machine.consul.identity[0], "principal_id")}"

  lifecycle {
    ignore_changes = ["name"]
  }
}
