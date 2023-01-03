resource "azurerm_virtual_network" "graf-vnet" {
  name                = "graf-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.graf.location
  resource_group_name = azurerm_resource_group.graf.name
}

resource "azurerm_subnet" "graf-subnet" {
  name                 = "graf-subnet"
  resource_group_name  = azurerm_resource_group.graf.name
  virtual_network_name = azurerm_virtual_network.graf-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "graf" {
  name                = "graf"
  location            = azurerm_resource_group.graf.location
  resource_group_name = azurerm_resource_group.graf.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_security_group" "graf-nsg" {
  name                = "graf-nsg"
  location            = azurerm_resource_group.graf.location
  resource_group_name = azurerm_resource_group.graf.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "${chomp(data.http.myip.response_body)}/32"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "0.0.0.0/0"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "graf Demo"
  }
}

resource "azurerm_network_interface" "graf-nic" {
  name                = "graf-nic"
  location            = azurerm_resource_group.graf.location
  resource_group_name = azurerm_resource_group.graf.name

  ip_configuration {
    name                          = "myNicConfiguration"
    subnet_id                     = azurerm_subnet.graf-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.graf.id
  }
}

resource "azurerm_network_interface_security_group_association" "graf" {
  network_interface_id      = azurerm_network_interface.graf-nic.id
  network_security_group_id = azurerm_network_security_group.graf-nsg.id
}
