variable "rest_api_id" {
  description = "The ID of the REST API."
  type        = string
}

variable "resource_id" {
  description = "The resource ID."
  type        = string
}

variable "http_method" {
  description = "The HTTP method (GET, POST, PUT, DELETE, etc.)."
  type        = string
}

variable "integration_type" {
  description = "The integration type (AWS, HTTP, MOCK, etc.)."
  type        = string
}

variable "cache_key_parameters" {
  description = "Cache key parameters."
  type        = list(string)
  default     = []
}

variable "cache_namespace" {
  description = "The cache namespace."
  type        = string
  default     = ""
}

variable "timeout_milliseconds" {
  description = "Timeout in milliseconds."
  type        = number
}

variable "request_parameters" {
  description = "Request parameters."
  type        = map(string)
  default     = {}
}

variable "request_templates" {
  description = "Request templates."
  type        = map(string)
  default     = {}
}

variable "integration_uri" {
  description = "The integration URI."
  type        = string
  default     = ""
}
