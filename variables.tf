# variable should be in a saperate file like this file and varibles 

variable "project_id" {
    type = string
    description = "GCP Project id"
}

variable "service_account" {
    type = string
    description = "Service Account"
  
}

variable "bucket_name" {
    type = string
    description = "Bucket Name"
  
}

variable "region" {
    type = string
    description = "Region"
    default = "us-central1"
  
}

variable "zone" {
    type = string
    description = "Zone"
    default = "us-central1-c"
  
}

variable "timeout" {
    type = number
    description = "timeout duration in seconds"
    default = 300
}

variable "available_memory_mb" {
    type = number
    description = "Memory requirement in mb"
    default = 2048
}

variable "trigger_http" {
    type = bool
    description = "the function can be invoked by sending an HTTP request to its URL. This allows the function to act as a web service, responding to requests with its output."
    default = false
}
