# Execution Log

## Day 1

### Completed
- Created repo structure
- Created platform decision file
- Created naming convention file
- Created README skeleton

### Decisions
- CPU-first path
- GitOps-first deployment (superseded by the Day 2 direct-deployment decision)
- Terraform PR Agent will be constrained to PR generation only

### Blockers
- None

### Next
- Build Terraform module skeleton (completed in the sibling `terraform` repository)

## Day 2

### Direction Change
- Skip Argo CD for the initial implementation.
- Build the Azure infrastructure foundation first.
- Configure AKS directly with Helm or Kubernetes manifests.
- Deploy vLLM and serve an OSS model through an OpenAI-compatible API.
- Integrate the endpoint with VS Code after direct API testing works.

### Completed
- Added `infra/envs/dev` Terraform root stack skeleton.
- Wired the dev root stack to the reusable resource group module from the sibling `terraform` repo.

### Next
- Compose the dev root stack from the reusable resource group, virtual network, ACR, AKS, and role-assignment modules.

## Day 3

### Completed
- Completed and merged the initial reusable module baseline in the sibling `terraform` repository: resource group, virtual network, ACR, AKS, and generic role assignment.
- Defined the ACR pull path: grant the AKS kubelet identity the `AcrPull` role at ACR scope.

### Next
- Migrate `infra/envs/dev` from the legacy module paths to the current reusable modules.
- Validate the dev root stack with `terraform plan`; do not run `terraform apply` through an agent.
- Deploy the vLLM manifests and test the API through port-forward.
