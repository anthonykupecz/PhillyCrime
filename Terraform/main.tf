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

#   provisioner "remote-exec" {
#     connection {
#       type        = "ssh"
#       user        = var.ssh_user
#       host        = google_compute_instance.instance.network_interface[0].access_config[0].nat_ip
#       private_key = file(var.ssh_private)
#     }
#     inline = [
#       "sudo apt-get install wget",
#       "wget https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh",
#       "bash Anaconda3-2022.10-Linux-x86_64.sh -b -p /home/anthonykupeczbitch/anaconda3",
#       "export PATH=/home/anthonykupeczbitch/anaconda3/bin:$PATH",
#       "source /home/anthonykupeczbitch/anaconda3/etc/profile.d/conda.sh",
#       "conda create -y -n conda_venv python=3.9",
#       "export PATH=/home/anthonykupeczbitch/anaconda3/envs/conda_venv/bin:$PATH",
#       "source activate conda_venv",
#       "cd /home/anthonykupeczbitch/",
#       "pip install requests pandas pandas-gbq pathlib pyarrow dbt-bigquery dbt-core jupyter gcsfs"
#     ]
#   }
# }