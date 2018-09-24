resource "google_container_cluster" "gcp_kubernetes" {
    name               = "${var.cluster_name}"
    zone               = "us-east1"
    initial_node_count = "${var.gcp_cluster_count}"
    additional_zones = [
        "us-east1-b",
        "us-east1-c",
        "us-east1-d",
    ]
    
    node_config {
        oauth_scopes = [
          "https://www.googleapis.com/auth/compute",
          "https://www.googleapis.com/auth/devstorage.read_only",
          "https://www.googleapis.com/auth/logging.write",
          "https://www.googleapis.com/auth/monitoring",
        ]
        labels {
            this-is-for = "dev-cluster"
        }
        tags = ["dev", "work"]
    }
}
