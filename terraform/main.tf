provider "azurerm" {
  version = "=1.30.1"
}

resource "azurerm_resource_group" "test" {
  name     = "ms-hashi-webinar"
  location = "West US"
}

resource "azurerm_kubernetes_cluster" "test" {
  name                = "ms-hashi-webinar"
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  dns_prefix          = "mshashi"

  agent_pool_profile {
    name            = "default"
    count           = 1
    vm_size         = "Standard_D1_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.test.kube_config[0].client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.test.kube_config_raw
}

