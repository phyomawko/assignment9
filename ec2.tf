
resource "aws_instance" "vpcA_server" {
  ami           = "ami-08908d9e195550170" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.vpcA-subnet.id
  iam_instance_profile  = aws_iam_instance_profile.ssm_instance_profile.name
  vpc_security_group_ids = [aws_security_group.pmk_security_group.id]
  tags = {
    Name = "VPC-A-Server"
  }
}

resource "aws_instance" "vpcB_server" {
  ami           = "ami-08908d9e195550170" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.vpcB-subnet.id
  iam_instance_profile  = aws_iam_instance_profile.ssm_instance_profile.name
  vpc_security_group_ids = [aws_security_group.pmk_security_group2.id]
  tags = {
    Name = "VPC-B-Server"
  }
}