module "aks" {
  source              = "Azure/aks/azurerm"
  version             = "1.0.0"
  prefix              = "${var.prefix}"
  location            = "${var.location}"
  kubernetes_version  = "${var.kubernetes_version}"
  CLIENT_ID           = "${var.CLIENT_ID}"
  CLIENT_SECRET       = "${var.CLIENT_SECRET}"
}