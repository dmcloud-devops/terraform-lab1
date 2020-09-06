variable "public_key" {
  default     = "XXXXX"
}

variable "vpc_id" {
  type    = string
  default = "XXX"
}

variable "vpc_subnet" {
  type    = list(string)
  default = ["XXX"]
}