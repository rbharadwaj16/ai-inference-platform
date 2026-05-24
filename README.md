# AI Inference Platform on AKS

## Goal

Build a practical AI inference platform on Azure Kubernetes Service that serves traditional ML and LLM-style workloads using Terraform, Argo CD, ACR, Key Vault, Azure Monitor, Prometheus/Grafana, FastAPI, and vLLM.

## Real-World Story

A fintech platform team needs a standard internal platform for deploying AI inference workloads. Product and data teams need to deploy fraud scoring, risk prediction, anomaly detection, and assistant-style services without building custom infrastructure every time.

## Architecture

Client -> Ingress -> AKS Inference Workloads -> FastAPI / vLLM -> Observability

## Main Components

- AKS
- Terraform
- Argo CD
- Azure Container Registry
- Azure Key Vault
- Workload Identity
- Azure Monitor
- Prometheus/Grafana
- FastAPI
- vLLM

## Project Phases

1. Repo and architecture setup
2. Terraform AKS foundation
3. Argo CD GitOps foundation
4. FastAPI inference service
5. Observability
6. Autoscaling and load testing
7. vLLM endpoint
8. Failure scenarios
9. Final demo

## Safety Rules

- No direct production mutation by agents
- No `terraform apply` by agents
- GitOps-first application deployment
- CPU-first path
- GPU optional