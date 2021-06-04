# Please use terraform version12.29


variable env {
  default = "test"
}
variable location-name {
  default = "East US"
}
variable admin_password {
  default = "Password1234!"
}

/*
"${var.env}-Be-rg"
"${var.env}-Web-vnet"
"${var.env}-Web-subnet"
"${var.env}-Web"
"${var.env}-Fe-rg"
"${var.env}-Fe-vnet"
"${var.env}-Jbox-subnet"
"${var.env}-Pub-ip01"
"${var.env}-FW-01"
"${var.env}-Jbox-rg"
"${var.env}-Jbox"
*/