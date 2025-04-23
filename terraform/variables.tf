variable "credentials" {
  description = "Service Account Credentials"
  default     = "/home/hbg/.keys/tfl.json"
}


variable "project" {
  description = "Project"
  default     = "tfl-data-visualization" # replace with your project id
}

variable "region" {
  description = "Region"
  default     = "asia-northeast2" # replace with your region
}

variable "location" {
  description = "Bucket Location"
  default     = "ASIA-NORTHEAST2" # replace with your location
}

variable "bq_dataset_name" {
  description = "BigQuery Dataset Name"
  default     = "tfl"
}

variable "gcs_bucket_name" {
  description = "Storage Bucket Name"
  default     = "tfl-data-visualization-bucket" # replace with your bucket name and make sure it's globally unique
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}