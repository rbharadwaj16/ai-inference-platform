# Dev Infrastructure Root Stack

This directory is the Terraform root module for the dev AI inference platform.

The root stack calls reusable Azure modules from the sibling `terraform` repo. In Terraform terms, this directory is the root module because this is where `terraform plan` is run. The reusable modules it calls are child modules.

## Current Scope

- Resource group via `az_platform_modules/modules/resource-group`
- Virtual network and AKS system subnet via `az_platform_modules/modules/virtual-network`
- AKS via `az_platform_modules/modules/aks`

## Next Infrastructure Modules

Add these as reusable modules in the sibling `terraform` repo, then call them from this root stack:

1. Azure Container Registry
2. Log Analytics workspace
3. Key Vault
4. Optional user node pool for inference workloads

## Deployment Direction

Argo CD is intentionally skipped for now. The first platform path is:

1. Provision Azure infrastructure with Terraform.
2. Connect to AKS locally.
3. Install runtime components directly with Helm or Kubernetes manifests.
4. Deploy vLLM and expose an OpenAI-compatible endpoint.
5. Test the endpoint from VS Code.

Do not run `terraform apply` through an agent. Use `terraform plan` for validation and review, then apply manually when ready.
