resource "helm_release" "ingress_nginx" {
  name              = "ingress-nginx"
  namespace         = "ingress-nginx"
  create_namespace  = true
  repository        = "https://kubernetes.github.io/ingress-nginx"
  chart             = "ingress-nginx"
  version           = "4.7.2"
  wait              = true
  timeout           = 300

  set {
    name    = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-ipv4"
    value   = azurerm_public_ip.public_ip.ip_address
  }

  set {
    name    = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-resource-group"
    value   = var.resource_group_name
  }

  set {
    name    = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-health-probe-request-path"
    value   = "/healthz"
  }

  set {
    name    = "controller.containerSecurityContext.runAsUser"
    value   = 101
  }

  set {
    name    = "controller.containerSecurityContext.runAsGroup"
    value   = 101
  }

  set {
    name    = "controller.containerSecurityContext.allowPrivilegeEscalation"
    value   = false
  }

  set {
    name    = "controller.containerSecurityContext.readOnlyRootFilesystem"
    value   = false
  }

  set {
    name    = "controller.containerSecurityContext.runAsNonRoot"
    value   = true
  }

  set_list {
    name    = "controller.containerSecurityContext.capabilities.drop"
    value   = ["ALL"]
  }

  set_list {
    name    = "controller.containerSecurityContext.capabilities.add"
    value   = ["NET_BIND_SERVICE"]
  }
}