variable "technitium_server_url" {
  description = "Technitium DNS Server URL"
  type        = string
  default     = "http://127.0.0.1:5380"
}

variable "TECHNITIUM_API_TOKEN" {
  description = "Technitium API token"
  type        = string
  sensitive   = true
}