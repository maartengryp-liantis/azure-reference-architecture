# We need to manually install the Nvidia Device plugin because aks-custom-headers is not supported:
# https://github.com/hashicorp/terraform-provider-azurerm/issues/6793#issuecomment-1727379311

resource "helm_release" "nvidia_device_plugin" {
  count             = var.enable_gpu_nodepool ? 1 : 0
  name              = "nvidia-device-plugin"
  namespace         = "nvidia-device-plugin"
  create_namespace  = true
  repository        = "https://nvidia.github.io/k8s-device-plugin"
  chart             = "nvidia-device-plugin"
  version           = "0.14.1"
  wait              = true
  timeout           = 300

  set {
    name = "tolerations[0].key"
    value= "CriticalAddonsOnly"
  }
  set {
    name = "tolerations[0].operator"
    value= "Exists"
  }

  set {
    name = "tolerations[1].key"
    value= "nvidia.com/gpu"
  }
  set {
    name = "tolerations[1].operator"
    value= "Exists"
  }
  set {
    name = "tolerations[1].effect"
    value= "NoSchedule"
  }

  set {
    name = "tolerations[2].key"
    value= "sku"
  }
  set {
    name = "tolerations[2].operator"
    value= "Equal"
  }
  set {
    name = "tolerations[2].value"
    value= "gpu"
  }
  set {
    name = "tolerations[2].effect"
    value= "NoSchedule"
  }
}