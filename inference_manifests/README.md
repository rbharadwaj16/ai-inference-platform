# Direct vLLM Deployment

This is the direct, non-GitOps CPU smoke-test deployment for vLLM. It serves
Meta Llama 3.2 1B through vLLM's OpenAI-compatible HTTP API. It is intentionally
single-replica and accessed through `kubectl port-forward` only.

## Prerequisites

- `kubectl` context points to the target AKS cluster.
- The cluster has a CPU node with at least 2 allocatable CPUs and 8 GiB memory.
- You have accepted the Hugging Face access terms for
  `meta-llama/Llama-3.2-1B-Instruct` and exported an access token as `HF_TOKEN`.

## Deploy

Create the namespace first. The Hugging Face token is then created directly in
the cluster and is not stored in Git. Re-running the Secret command updates the
existing Secret safely.

```bash
kubectl apply -f inference_manifests/vllm/base/01-namespace.yaml

kubectl create secret generic hf-token \
  --namespace ai-inference \
  --from-literal=HF_TOKEN="$HF_TOKEN" \
  --dry-run=client -o yaml | kubectl apply -f -

kubectl apply -k inference_manifests/vllm/base
kubectl rollout status deployment/vllm --namespace ai-inference --timeout=20m
```

## Verify

Use a second terminal while the port-forward remains open:

```bash
kubectl port-forward --namespace ai-inference service/vllm 8000:8000
```

```bash
curl http://127.0.0.1:8000/v1/models
curl http://127.0.0.1:8000/v1/chat/completions \
  -H 'Content-Type: application/json' \
  -d '{"model":"llama-3.2-1b-instruct","messages":[{"role":"user","content":"Reply with exactly: vLLM is ready"}],"max_tokens":16}'
```

## Current Limits

- No client API-key authentication is enabled.
- Do not expose the Service through ingress or a public load balancer.
- CPU serving is only a functional smoke test; use a GPU node pool before
  expecting useful coding-assistant performance.
