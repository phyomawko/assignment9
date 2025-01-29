variable "vpcA_cidr" {
    default = "10.0.0.0/16"
  
}
variable "vpcB_cidr" {
    default = "192.168.0.0/16"
}

variable "vpcC_cidr" {
    default = "172.16.0.0/16"
}
variable "vpcA_subnet_cidr" {
    default = "10.0.1.0/24"
}
variable "vpcB_subnet_cidr" {
    default = "192.168.1.0/24"
}
variable "vpcC_subnet_cidr" {
    default = "172.16.1.0/24"
}
variable "vpcC_subnet2_cidr" {
    default = "172.16.2.0/24"
}