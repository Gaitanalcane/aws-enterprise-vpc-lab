variable "VPC_entreprise_lab" {
  description = "AWS_VPC_LAB"
  type        = string
  default     = "entreprise-vpc-lab"
}

variable "vpc_cidr" {
  description = "Main VPC IPV4 CIDR block"
  type        = string
  default     = "10.0.0.0/16"

}

variable "availability_zones" {
  description = "AWS Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}
variable "public_subnet_cidrs" {
  description = "public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.3.0/24"]
}
variable "private_subnet_cidrs" {
  description = "private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.2.0/24", "10.0.4.0/24"]
}

