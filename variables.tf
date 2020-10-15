variable "public_key" {
  default     = "xxx"
}

variable "vpc_id" {
  type    = string
  default = "vpc-xxx"
}

variable "vpc_subnet" {
  type    = list(string)
  default = ["subnet-xxx","subnet-xxx","subnet-xxx"]
}