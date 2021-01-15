## Create a VM instance
resource "google_compute_instance" "cloud_ui_poc_vm" {
  name                        = "test"
  zone                        = "us-central1-a"
  machine_type                = "n1-standard-1"
  allow_stopping_for_update   = true
  tags                        = ["web"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.cloud_ui_poc_subnetwork.self_link
  }

  service_account {
    email  = google_service_account.src_acc_poc.email
    scopes = ["cloud-platform"]
  }
}
