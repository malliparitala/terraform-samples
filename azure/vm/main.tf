
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.resource_group_name}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.resource_group_name}-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.resource_group_name}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.resource_group_name}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = null
  }

  depends_on = [azurerm_subnet.subnet]
}

resource "azurerm_management_lock" "nic" {
  name       = "mltest"
  scope      = azurerm_network_interface.nic.id
  lock_level = "ReadOnly"
}

resource "azurerm_virtual_machine_scale_set" "vmss" {
  name                         = "${var.resource_group_name}-vmss"
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name
  upgrade_policy_mode          = var.upgrade_policy_mode
  
    network_profile {
      name    = "network-profile"
      primary = true

      ip_configuration {
        name                          = "ipconfig"
        subnet_id                     = azurerm_subnet.subnet.id
        primary = true
      }
    }

    os_profile {
      computer_name_prefix = "vm"
      admin_username       = var.admin_username
      admin_password       = var.admin_password
    }

    sku {
      name     = "Standard_DS2_v2"
      tier     = "Standard"
      capacity = 2
    }

    storage_profile_os_disk {
      name              = "osdisk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
}