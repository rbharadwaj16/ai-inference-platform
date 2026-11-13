# Naming Conventions

## Project Prefix
aiplatform

## Environment Names
- dev
- prodlike

## Azure Region
Use the Azure location `eastus` and the short region code `eus` for the dev environment.

## Resource Group
rg-aiplatform-dev-eus-01
rg-aiplatform-prodlike-eus-01

## Virtual Network
vnet-aiplatform-dev-eus-01
vnet-aiplatform-prodlike-eus-01

## AKS System Subnet
snet-aks-system

## AKS Cluster
aks-aiplatform-dev-eus-01
aks-aiplatform-prodlike-eus-01

## ACR
acraiplatformdeveus01

ACR names cannot contain hyphens, so the project, environment, region code, and instance are concatenated.

## Key Vault
Deferred: kv-aiplatform-dev-eus-01

## Kubernetes Namespaces
- ai-inference

## vLLM Service
vllm-api
