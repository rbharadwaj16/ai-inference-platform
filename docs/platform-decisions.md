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
Azure Key Vault

## Identity
Azure Workload Identity

## Observability
Azure Monitor, Prometheus, Grafana

## Traditional ML Serving
FastAPI

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
GPU node pool for vLLM if quota and cost allow.

## Deployment Rule
Application workloads can be deployed directly in dev while the inference path is being proven. GitOps will be added later.

## Safety Rule
Agents can propose Terraform changes through PRs, but must not run terraform apply.
