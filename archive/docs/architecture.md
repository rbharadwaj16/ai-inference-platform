# Architecture

## Goal

Host an open-source model on AKS using vLLM, expose an OpenAI-compatible API endpoint, and integrate that endpoint with VS Code for local developer workflows.

## Initial Path

Argo CD is deferred. The first implementation proves the infrastructure and inference path directly:

```text
VS Code / local client
  -> vLLM OpenAI-compatible API
  -> AKS service or ingress
  -> vLLM pod
  -> OSS model runtime
```

## Infrastructure Foundation

The immediate goal is a working vLLM endpoint, not a fully hardened platform.

### Must-Have Path

- Resource group
- Virtual network and AKS subnet
- Azure Container Registry
- AKS cluster
- ACR pull role assignment for the AKS kubelet identity
- Optional dedicated inference node pool when accelerator capacity is needed

The reusable Terraform module baseline is complete in the sibling `terraform` repository: resource group, virtual network, ACR, AKS, and generic role assignment. The next task is to compose those independent modules in `infra/envs/dev`.

### Deferred Hardening And Operations

- Log Analytics workspace and AKS diagnostic settings
- Key Vault integration and Azure Workload Identity
- Private endpoints and private DNS
- Private networking for ACR and Key Vault
- Expanded metrics, logging, autoscaling, and load testing

The already-created Key Vault and ACR modules remain reusable platform building blocks, but their advanced integrations are deferred until the direct inference path works.

## Terraform Boundary

This repo owns the environment root stacks, starting with `infra/envs/dev`.

The sibling `terraform` repo owns reusable child modules. This repo should call those modules rather than duplicating reusable Azure resource logic.

## Runtime Foundation

After the dev root stack is provisioned, install runtime components directly with Kubernetes manifests:

- vLLM deployment
- Kubernetes service for the OpenAI-compatible API
- port-forward access for the first local client test

An ingress controller is optional and comes after the port-forward test proves the API path.

## Later GitOps Path

Once the direct deployment path works, move runtime manifests into GitOps and introduce Argo CD as the reconciler.
