
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.VPC_entreprise_lab}-igw"
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }
}
