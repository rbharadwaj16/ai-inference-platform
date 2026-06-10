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

The dev environment should include:

- Resource group
- Virtual network and AKS subnet
- Azure Container Registry
- Log Analytics workspace
- Key Vault
- AKS cluster
- Optional dedicated node pool for inference workloads

## Terraform Boundary

This repo owns the environment root stacks, starting with `infra/envs/dev`.

The sibling `terraform` repo owns reusable child modules. This repo should call those modules rather than duplicating reusable Azure resource logic.

## Runtime Foundation

After AKS exists, install platform runtime components directly with Helm or Kubernetes manifests:

- ingress controller if external access is needed
- vLLM deployment
- Kubernetes service for the OpenAI-compatible API
- optional secret/config management
- basic metrics/logging

## Later GitOps Path

Once the direct deployment path works, move runtime manifests into GitOps and introduce Argo CD as the reconciler.
