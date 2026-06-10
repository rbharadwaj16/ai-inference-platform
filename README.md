# AI Inference Platform on AKS

## Goal

Build a practical AI inference platform on Azure Kubernetes Service that serves traditional ML and LLM-style workloads using Terraform, Argo CD, ACR, Key Vault, Azure Monitor, Prometheus/Grafana, FastAPI, and vLLM.

## Real-World Story

A fintech platform team needs a standard internal platform for deploying AI inference workloads. Product and data teams need to deploy fraud scoring, risk prediction, anomaly detection, and assistant-style services without building custom infrastructure every time.

## Architecture

Client / VS Code -> Ingress or port-forward -> AKS Inference Workloads -> vLLM OpenAI-compatible API -> Observability

## Main Components

- AKS
- Terraform
- Azure Container Registry
- Azure Key Vault
- Workload Identity
- Azure Monitor
- Prometheus/Grafana
- FastAPI
- vLLM
- Helm / Kubernetes manifests

## Project Phases

1. Repo and architecture setup
2. Terraform AKS foundation
3. Direct cluster setup with Helm or Kubernetes manifests
4. vLLM endpoint serving an OSS model through an OpenAI-compatible API
5. VS Code integration test
6. Observability
7. Autoscaling and load testing
8. Optional Argo CD GitOps foundation
9. Failure scenarios
10. Final demo

## Safety Rules

- No direct production mutation by agents
- No `terraform apply` by agents
- Direct dev deployment first; GitOps later
- CPU-first path
- GPU optional
