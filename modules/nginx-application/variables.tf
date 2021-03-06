variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-west-1"
}

variable "public_key_path" {
  description = <<DESCRIPTION
Path to the SSH public key to be used for authentication.
Ensure this keypair is added to your local SSH agent so provisioners can
connect.

Example: ~/.ssh/terraform.pub
DESCRIPTION
}

variable "private_key_path" {
  description = <<DESCRIPTION
Path to the SSH private key to be used for authentication.

Example: ~/.ssh/id_rsa
DESCRIPTION
}

variable "key_name" {
  description = "Desired name of AWS key pair"
}

variable "vpc_id" {
  description = "The VPC to launch the server in"
}

variable "subnet_id" {
  description = "The subnet to launch the server in"
}