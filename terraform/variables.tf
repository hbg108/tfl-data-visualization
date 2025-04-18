variable "credentials" {
  description = "Service Account Credentials"
  default     = "../.keys/tfl.json"
}


variable "project" {
  description = "Project"
  default     = "de-zc-hbg" # replace with your project id
}

variable "region" {
  description = "Region"
  default     = "asia-northeast2" # replace with your region
}

variable "location" {
  description = "Project Location"
  default     = "ASIA-NORTHEAST2" # replace with your region
}

variable "bq_dataset_name" {
  description = "BigQuery Dataset Name"
  default     = "tfl_dataset"
}

variable "gcs_bucket_name" {
  description = "Storage Bucket Name"
  default     = "de-zc-hbg-tfl-bucket" # replace with your bucket name and make sure it's globally unique
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}