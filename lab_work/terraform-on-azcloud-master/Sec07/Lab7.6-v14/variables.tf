variable "env" {
  type    = string
  default = "test"
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