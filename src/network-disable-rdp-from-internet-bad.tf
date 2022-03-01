 resource "azurerm_network_security_rule" "bad_example" {
      name                        = "bad_example_security_rule"
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "TCP"
      source_port_range           = "*"
      destination_port_ranges     = ["3389"]
      source_address_prefix       = "*"
      destination_address_prefix  = "*"
 }

 resource "azurerm_network_security_group" "example" {
   name                = "tf-appsecuritygroup"
   location            = azurerm_resource_group.example.location
   resource_group_name = azurerm_resource_group.example.name

   security_rule {
     source_port_range           = "any"
      destination_port_ranges     = ["3389"]
      source_address_prefix       = "*"
      destination_address_prefix  = "*"
   }
 }