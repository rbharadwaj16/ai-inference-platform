locals {
  project = "aiplatform"

  context = {
    app      = local.project
    env      = var.environment
    region   = var.region_code
    instance = "01"
  }

  common_tags = merge(
    {
      project     = local.project
      environment = var.environment
      managed_by  = "terraform"
      workload    = "ai-inference"
    },
    var.tags
  )
}
