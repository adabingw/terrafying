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

variable "status_code" {
  description = "Request parameters."
  type        = string
  default     = ""
}

variable "response_templates" {
  description = "Request templates."
  type        = map(string)
  default     = {}
}
