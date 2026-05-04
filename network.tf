# VPC Endpoints for private access (optional)
resource "aws_security_group" "vpc_endpoint" {
  count = var.vpc_id != "" ? 1 : 0

  name_prefix = "vpc-endpoint-"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

resource "aws_vpc_endpoint" "s3" {
  count = var.vpc_id != "" ? 1 : 0

  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"

  tags = var.tags
}

resource "aws_vpc_endpoint" "dynamodb" {
  count = var.vpc_id != "" && length(var.private_subnet_ids) > 0 ? 1 : 0

  vpc_id             = var.vpc_id
  service_name       = "com.amazonaws.${var.region}.dynamodb"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = var.private_subnet_ids
  security_group_ids = [aws_security_group.vpc_endpoint[0].id]

  tags = var.tags
}

