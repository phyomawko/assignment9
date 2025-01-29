# Security Group for App Server
resource "aws_security_group" "pmk_security_group" {
  name        = "vpcAsg"
  description = "Allow inbound ICMP and necessary traffic"
  vpc_id = aws_vpc.vpcA.id

  ingress {
    description = "Allow ICMP"
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc-A-sg"
  }
}

resource "aws_security_group" "pmk_security_group2" {
  name        = "vpcBsg"
  description = "Allow inbound ICMP and necessary traffic"
  vpc_id = aws_vpc.vpcB.id

  ingress {
    description = "Allow ICMP"
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc-B-sg"
  }
}