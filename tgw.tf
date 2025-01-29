resource "aws_ec2_transit_gateway" "tgw" {
    description = "My Transit Gateway"
    default_route_table_propagation = "disable"
    default_route_table_association = "disable"
    tags = {
      Name = "Assignment9-TGW"
    }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpcA_attachment" {
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
    vpc_id             = aws_vpc.vpcA.id  
    subnet_ids          = [aws_subnet.vpcA-subnet.id]
    tags = {
      Name = "Assignment9-VPC-A-Attachment"
    }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpcB_attachment" {
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
    vpc_id             = aws_vpc.vpcB.id
    subnet_ids         = [aws_subnet.vpcB-subnet.id]  
    tags = {
      Name = "Assignment9-VPC-B-Attachment"
    }
}
resource "aws_ec2_transit_gateway_vpc_attachment" "vpcC_attachment" {
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
    vpc_id             = aws_vpc.vpcC.id
    subnet_ids         = [aws_subnet.vpcC-subnet.id,aws_subnet.vpcC-subnet2.id]
    tags = {
      Name = "Assignment9-VPC-C-Attachment"
    }
}

resource "aws_ec2_transit_gateway_route_table" "tgw_rtAB" {
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
}

resource "aws_ec2_transit_gateway_route" "tgw_rtAB_route" {
    transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rtAB.id
    destination_cidr_block = "0.0.0.0/0"
    transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpcC_attachment.id
}
resource "aws_ec2_transit_gateway_route_table" "tgw_rtC" {
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
}

resource "aws_ec2_transit_gateway_route" "tgw_rtC_route" {
    transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rtC.id
    destination_cidr_block = "10.0.0.0/16"
    transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpcA_attachment.id
}
resource "aws_ec2_transit_gateway_route" "tgw_rtC_route2" {
    transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rtC.id
    destination_cidr_block = "192.168.0.0/16"
    transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpcB_attachment.id
}



resource "aws_ec2_transit_gateway_route_table_association" "tgw_rtA_association" {
    transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpcA_attachment.id
    transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rtAB.id
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw_rtB_association" {
    transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpcB_attachment.id
    transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rtAB.id
}
resource "aws_ec2_transit_gateway_route_table_association" "tgw_rtC_association" {
    transit_gateway_attachment_id = aws_ec2_transit_gateway_vpc_attachment.vpcC_attachment.id
    transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.tgw_rtC.id
}