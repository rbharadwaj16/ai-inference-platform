# Dev Infrastructure Root Stack

This directory is the Terraform root module for the dev AI inference platform.

The root stack calls reusable Azure modules from the sibling `terraform` repo. In Terraform terms, this directory is the root module because this is where `terraform plan` is run. The reusable modules it calls are child modules.

## Target Scope

- Resource group via `terraform/modules/terraform-azurerm-resource-group`
- Virtual network and AKS system subnet via `terraform/modules/terraform-azurerm-virtual-network`
- Azure Container Registry via `terraform/modules/terraform-azurerm-container-registry`
- AKS via `terraform/modules/terraform-azurerm-aks`
- `AcrPull` role assignment for the AKS kubelet identity via `terraform/modules/terraform-azurerm-role-assignment`

## Current Migration State

`main.tf` is still wired to the legacy `az_platform_modules` paths and has not yet added ACR or the `AcrPull` role assignment. The next implementation change is to replace those sources with the target modules above and adapt the root stack to their direct-input contracts.

Log Analytics, Key Vault integration, private endpoints, and a dedicated inference node pool are deferred until the direct vLLM path works.

## Deployment Direction

Argo CD is intentionally skipped for now. The first platform path is:

1. Provision Azure infrastructure with Terraform.
2. Connect to AKS locally.
3. Install runtime components directly with Helm or Kubernetes manifests.
4. Deploy vLLM and expose an OpenAI-compatible endpoint.
5. Test the endpoint from VS Code.

Do not run `terraform apply` through an agent. Use `terraform plan` for validation and review, then apply manually when ready.
