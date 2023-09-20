```bash
cat <<EOF > aks-cluster-new.yaml
apiVersion: core.api.humanitec.io/v1
kind: Definition
metadata:
  id: aks-cluster-new
object:
  name: aks-cluster-new
  type: k8s-cluster
  driver_type: ${HUMANITEC_ORG}/terraform
  driver_inputs:
    values:
      append_logs_to_error: true
      source:
        path: resources/terraform/azure-aks-new
        rev: refs/heads/main
        url: https://github.com/Humanitec-DemoOrg/azure-reference-architecture.git
      variables:
        location: ${LOCATION}
        resource_group_name: ${RESOURCE_GROUP}
        existing_acr_name: ${ACR_NAME}
        enable_gpu_nodepool: false
        node_size: Standard_DS2_v2
    secrets:
      variables:
        credentials:
          azure_subscription_id: ${AZURE_SUBSCRIPTION_ID}
          azure_subscription_tenant_id: ${AZURE_SUBSCRIPTION_TENANT_ID}
          service_principal_id: ${TERRAFORM_CONTRIBUTOR_SP_ID}
          service_principal_password: ${TERRAFORM_CONTRIBUTOR_SP_PASSWORD}
  criteria:
    - env_type: azure
      app_id: triton
EOF
humctl create \
    -f aks-cluster-new.yaml
```