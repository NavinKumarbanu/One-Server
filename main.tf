# Configure the Google Cloud provider
provider "google" {
  project = "terraform-examples-gcloud"
  region  = "us-east1"
}

# Create a Google Compute instance
resource "google_compute_instance" "example" {
  name          = "example"
  machine_type  = "e2-medium"
  zone          = "us-east1-b"
  
  boot_disk {
    initialize_params {
      image = "ubuntu-1604-lts"
    }
  }
  
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
  
  tags = ["terraform-example"]
}
