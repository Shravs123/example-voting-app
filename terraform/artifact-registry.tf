resource "google_artifact_registry_repository" "voting_app" {
  location      = var.region
  repository_id = "voting-app"
  description   = "Docker repository for voting application"
  format        = "DOCKER"
}


