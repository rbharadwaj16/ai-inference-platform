# Platform Decisions

## Cloud
Azure

## Kubernetes
Azure Kubernetes Service

## Infrastructure as Code
Terraform

## GitOps
Deferred. Argo CD will be introduced after the direct vLLM deployment path works.

## Container Registry
Azure Container Registry

## Secrets
Deferred. Azure Key Vault is not needed for the first public-image, port-forward inference test.

## Identity
Deferred. Azure Workload Identity will be introduced with Key Vault or another workload-to-Azure integration.

## Observability
Deferred until the direct vLLM endpoint works.

## Traditional ML Serving
Deferred. The initial runtime is vLLM only.

## LLM Serving
vLLM

## Initial Cluster Configuration
Helm or Kubernetes manifests applied directly during dev setup.

## Load Testing
k6

## CI/CD
GitHub Actions

## Environments
- dev
- prod-like

## Mandatory Path
CPU-first.

## Optional Extension
Dedicated GPU node pool for vLLM if quota and cost allow.

## Deployment Rule
Application workloads can be deployed directly in dev while the inference path is being proven. GitOps will be added later.

## Safety Rule
Agents can propose Terraform changes through PRs, but must not run terraform apply.
