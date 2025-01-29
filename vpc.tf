resource "aws_vpc" "vpcA" {
    cidr_block = var.vpcA_cidr
    tags = {
      Name= "VPC-A"
    }
  
}

resource "aws_vpc" "vpcB" {
    cidr_block = var.vpcB_cidr
    tags = {
        Name= "VPC-B"
    }
}

resource "aws_vpc" "vpcC" {
    cidr_block = var.vpcC_cidr
    tags = {
        Name= "VPC-C"
    }
}

resource "aws_subnet" "vpcA-subnet" {
    vpc_id = aws_vpc.vpcA.id
    cidr_block = var.vpcA_subnet_cidr
    availability_zone = "ap-southeast-1a"
    
    tags = {
        Name = "VPC-A-Subnet"
    }
  
}

resource "aws_subnet" "vpcB-subnet" {
    vpc_id = aws_vpc.vpcB.id
    cidr_block = var.vpcB_subnet_cidr
    availability_zone = "ap-southeast-1b"
    tags = {
        Name = "VPC-B-Subnet"
    }
  
}

resource "aws_subnet" "vpcC-subnet" {
    vpc_id = aws_vpc.vpcC.id
    cidr_block = var.vpcC_subnet_cidr
    availability_zone = "ap-southeast-1a"
    tags = {
        Name = "VPC-C-Private-Subnet"
    }
  
}

resource "aws_subnet" "vpcC-subnet2" {
    vpc_id = aws_vpc.vpcC.id
    cidr_block = var.vpcC_subnet2_cidr
    availability_zone = "ap-southeast-1b"
    tags = {
        Name = "VPC-C-Public-Subnet"
    }
  
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpcC.id
  tags = {
    Name = "IGW"
  }
}
resource "aws_eip" "nat_eip" {
    tags = {
      Name = "NAT-EIP"
    }
    
}

resource "aws_nat_gateway" "nat_gw" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id     = aws_subnet.vpcC-subnet2.id
    tags = {
        Name = "NAT-Gateway-Ass9"
    }
}



