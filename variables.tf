variable "public_key" {
  default     = "XXXXXX"
}

variable "vpc_id" {
  type    = string
  default = "xxxx"
}

variable "vpc_subnet" {
  type    = list(string)
  default = ["xxxx"]
}