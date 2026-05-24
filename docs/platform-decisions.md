# Platform Decisions

## Cloud
Azure

## Kubernetes
Azure Kubernetes Service

## Infrastructure as Code
Terraform

## GitOps
Argo CD

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
Application workloads must be deployed through GitOps.

## Safety Rule
Agents can propose Terraform changes through PRs, but must not run terraform apply.