resource "google_container_cluster" "gke" {
  name     = "demo-gke"
  location = var.zone

  network    = google_compute_network.voting_vpc.id
  subnetwork = google_compute_subnetwork.voting_subnet.id

  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }
}

resource "google_container_node_pool" "primary" {
  name     = "primary-node-pool"
  location = var.zone
  cluster  = google_container_cluster.gke.name

  node_count = 2

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 30
    disk_type    = "pd-standard"
  }
}


