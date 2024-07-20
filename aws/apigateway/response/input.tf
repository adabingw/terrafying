variable "rest_api_id" {
  description = "The ID of the REST API."
  type        = string
}

variable "status_code" {
  description = "The HTTP status code for the response."
  type        = string
}

variable "response_type" {
  description = "The response type."
  type        = string
}

variable "response_templates" {
  description = "The response templates."
  type        = map(string)
  default     = {}
}

variable "response_parameters" {
  description = "The response parameters."
  type        = map(string)
  default     = {}
}
