resource "aws_route_table" "vpcA-route-table" {
    vpc_id = aws_vpc.vpcA.id
    route {
        cidr_block = "0.0.0.0/0"
        transit_gateway_id = aws_ec2_transit_gateway.tgw.id
    }
    
    tags = {
        Name = "VPC-A-Route-Table"
    }
  
}
resource "aws_route_table" "vpcB-route-table" {
    vpc_id = aws_vpc.vpcB.id
    route {
        cidr_block = "0.0.0.0/0"
        transit_gateway_id = aws_ec2_transit_gateway.tgw.id
    }
    tags = {
        Name = "VPC-B-Route-Table"
    }
}
resource "aws_route_table" "vpcC-private-route-table" {
    vpc_id = aws_vpc.vpcC.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gw.id
    }
    
    tags = {
        Name = "VPC-C-Private-Route-Table"
    }
}
resource "aws_route_table" "vpcC-public-route-table" {
    vpc_id = aws_vpc.vpcC.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    route {
        cidr_block = "10.0.0.0/16"
        transit_gateway_id = aws_ec2_transit_gateway.tgw.id
    }
    route {
        cidr_block = "192.168.0.0/16"
        transit_gateway_id = aws_ec2_transit_gateway.tgw.id
    }
    tags = {
        Name = "VPC-C-Public-Route-Table"
    }
}

resource "aws_route_table_association" "vpcA-subnet-association" {
    subnet_id = aws_subnet.vpcA-subnet.id
    route_table_id = aws_route_table.vpcA-route-table.id
  
}
resource "aws_route_table_association" "vpcB-subnet-association" {
    subnet_id = aws_subnet.vpcB-subnet.id
    route_table_id = aws_route_table.vpcB-route-table.id
  
}
resource "aws_route_table_association" "vpcC-private-subnet-association" {
    subnet_id = aws_subnet.vpcC-subnet.id
    route_table_id = aws_route_table.vpcC-private-route-table.id
  
}
resource "aws_route_table_association" "vpcC-public-subnet-association" {
    subnet_id = aws_subnet.vpcC-subnet2.id
    route_table_id = aws_route_table.vpcC-public-route-table.id
  
}