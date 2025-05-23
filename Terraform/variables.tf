# Project Informaton
variable "project" {
  description = "A look at philadelphia crime" 
  type = string
  default = "phillycrime"
}
variable "location" {
  description = "Project Location"
  default     = "US"
}
variable "credentials" {
  description = "credential info"
  default     = "../../Key/cred.json"
}

# BigQuery Information
variable "bq_dataset_name" {
  description = "BigQuery Dataset"
  type = string
  default     = "philly_crime_db"
}

# Bucket Information
variable "storage_class" {
  description = "bucket storage class"
  default     = "STANDARD"
}
variable "storage_bucket_name" {
  description = "bucket storage name"
  type = string
  default     = "phillycrime_crime_bucket"
}

# VM Information
variable "ssh_user" {
  default = "anthonykupeczbitch"
}

variable "ssh_pub" {
  default = "/Users/anthonykupeczbitch/.ssh/ssh_key.pub" 
}

variable "ssh_private" {
  default = "/Users/anthonykupeczbitch/.ssh/ssh_key" 
}

variable "instance" {
  type = string
  default = "phillycrimevm"
}
# VM type
variable "machine_type" {
  type = string
  default = "e2-standard-4"
}

variable "zone" {
  description = "Region for VM"
  type = string
  default = "us-central1-a"
}