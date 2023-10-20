```bash
cat <<EOF > azure-redis-existing.yaml
apiVersion: core.api.humanitec.io/v1
kind: Definition
metadata:
  id: azure-redis-existing
object:
  name: azure-redis-existing
  type: redis
  driver_type: humanitec/terraform
  driver_inputs:
    values:
      append_logs_to_error: true
      source:
        path: resources/terraform/azure-redis-existing
        rev: refs/heads/main
        url: https://github.com/Humanitec-DemoOrg/azure-reference-architecture.git
      variables:
        redis_name: ${AZURE_REDIS_NAME}
        resource_group_name: ${AZURE_RESOURCE_GROUP}
    secrets:
      variables:
        credentials:
          azure_subscription_id: ${AZURE_SUBSCRIPTION_ID}
          azure_subscription_tenant_id: ${AZURE_SUBSCRIPTION_TENANT_ID}
          service_principal_id: ${TERRAFORM_CONTRIBUTOR_SP_ID}
          service_principal_password: ${TERRAFORM_CONTRIBUTOR_SP_PASSWORD}
  criteria:
    - {}
EOF
humctl create \
    -f azure-redis-existing.yaml
```