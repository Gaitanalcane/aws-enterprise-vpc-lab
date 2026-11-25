
# WEB SECURITY GROUP
resource "aws_security_group" "web" {
  name        = "${var.VPC_entreprise_lab}-web-sg"
  description = "Allow HTTPS traffic to web tier"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name        = "${var.VPC_entreprise_lab}-web-sg"
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }
}

# APP SECURITY GROUP
resource "aws_security_group" "app" {
  name        = "${var.VPC_entreprise_lab}-app-sg"
  description = "Allow traffic from web tier"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name        = "${var.VPC_entreprise_lab}-app-sg"
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }
}

# DATABASE SECURITY GROUP
resource "aws_security_group" "database" {
  name        = "${var.VPC_entreprise_lab}-database-sg"
  description = "Allow MySQL traffic from app tier"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name        = "${var.VPC_entreprise_lab}-database-sg"
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }
}

# HTTPS: INTERNET -> WEB
resource "aws_vpc_security_group_ingress_rule" "web_https" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  description       = "Allow HTTPS"
}

# APP: WEB -> APP
resource "aws_vpc_security_group_ingress_rule" "app_from_web" {
  security_group_id            = aws_security_group.app.id
  referenced_security_group_id = aws_security_group.web.id
  from_port                    = 8080
  to_port                      = 8080
  ip_protocol                  = "tcp"
  description                  = "Allow traffic from web tier"
}

# MYSQL: APP -> DATABASE
resource "aws_vpc_security_group_ingress_rule" "database_from_app" {
  security_group_id            = aws_security_group.database.id
  referenced_security_group_id = aws_security_group.app.id
  from_port                    = 3306
  to_port                      = 3306
  ip_protocol                  = "tcp"
  description                  = "Allow MySQL from app tier"
}


# WEB -> APP: ALLOW APPLICATION TRAFFIC
resource "aws_vpc_security_group_egress_rule" "web_to_app" {
  security_group_id            = aws_security_group.web.id
  referenced_security_group_id = aws_security_group.app.id
  from_port                    = 8080
  to_port                      = 8080
  ip_protocol                  = "tcp"
  description                  = "Allow web tier to reach app tier"
}

# APP -> DATABASE: ALLOW MYSQL TRAFFIC
resource "aws_vpc_security_group_egress_rule" "app_to_database" {
  security_group_id            = aws_security_group.app.id
  referenced_security_group_id = aws_security_group.database.id
  from_port                    = 3306
  to_port                      = 3306
  ip_protocol                  = "tcp"
  description                  = "Allow app tier to reach database"
}
