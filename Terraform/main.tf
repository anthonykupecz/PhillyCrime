# # Code to create VM instance 
# resource "google_compute_instance" "instance" {
#   name         = var.instance
#   machine_type = var.machine_type
#   zone         = var.zone
#   project      = var.project

#   boot_disk {
#     initialize_params {
#       image = "ubuntu-os-cloud/ubuntu-2004-lts"
#       size = 25
#     }
#   }

#   network_interface {
#     network    = "default"
#     subnetwork = "default"
#     access_config {
#       network_tier = "PREMIUM"
#     }
#   }

#   service_account {
#     email = "antservice@phillycrime.iam.gserviceaccount.com"
#     scopes = ["cloud-platform"]
#   }

#   metadata = {
#     sshKeys = "${var.ssh_user}:${file(var.ssh_pub)}"
#   }

<<