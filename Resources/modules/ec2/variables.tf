# variable "key_name" {
#    description = "creating new key pair"
#    default = "kevi"
# }

# variable "public_key" {
#   description = "creating public key"
#   default = "~/.ssh/id_rsa.pub"
# }

variable "instance_type" {
  description = "instance configuration"
  default = "t2.micro"
}

variable "ami_id" {
  description = "ami value"
  default = "ami-053b0d53c279acc90"
  
}