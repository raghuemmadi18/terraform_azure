variable "env" {
  type    = string
  default = "mgmt"
}
variable "location-name" {
  type    = string
  default = "East US"
}
variable "admin_password" {
  type      = string
  default   = "Password1234!"
  sensitive = true # example for terraform v14
}

variable "access-from" {
  default = "70.120.121.205"
}
