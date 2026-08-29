# AI Inference Platform on AKS

## Goal

Build a practical AI inference platform on Azure Kubernetes Service that serves an open-source model through vLLM and an OpenAI-compatible API.

## Real-World Story

A fintech platform team needs a standard internal platform for deploying AI inference workloads. Product and data teams need to deploy fraud scoring, risk prediction, anomaly detection, and assistant-style services without building custom infrastructure every time.

## Architecture

Client / VS Code -> port-forward -> AKS -> vLLM OpenAI-compatible API -> OSS model runtime

## Main Components

- AKS
- Terraform
- Azure Container Registry
- vLLM
- Helm / Kubernetes manifests
- port-forward access for the first local-client test

## Deferred Components

- Azure Key Vault and Workload Identity
- Azure Monitor, Prometheus, and Grafana
- private endpoints and private DNS
- autoscaling and load testing
- Argo CD and GitOps
- traditional ML-serving APIs such as FastAPI

## Project Phases

1. Repo and architecture setup
2. Compose the dev environment from the reusable Terraform modules
3. Provision the AKS, ACR, and ACR-pull integration path
4. Direct cluster setup with Kubernetes manifests
5. vLLM endpoint serving an OSS model through an OpenAI-compatible API
6. VS Code integration test through port-forward
7. Observability, autoscaling, and load testing
8. Optional Argo CD GitOps foundation
9. Failure scenarios
10. Final demo

## Safety Rules

- No direct production mutation by agents
- No `terraform apply` by agents
- Direct dev deployment first; GitOps later
- CPU-first path
- GPU optional
