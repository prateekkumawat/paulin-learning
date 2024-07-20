# create a vpc 
resource "aws_vpc" "devproject" {
  provider = aws
  cidr_block = var.aws_vpc_cidr
  tags  = { 
    Name = "project-batch-devops"
  }
}

# create a aws subnet public 
resource "aws_subnet" "publicsubnet1"{
    vpc_id = aws_vpc.devproject.id 
    cidr_block = var.aws_subnet_cidr[0]
    availability_zone = var.aws_subnet_az[0]
    map_public_ip_on_launch = "true"
    tags = {
      Name = "project-batch-devops-pubsub1-az1"
    }
}

# create a aws subnet private 
resource "aws_subnet" "privatesubnet1"{
    vpc_id = aws_vpc.devproject.id 
    cidr_block = var.aws_subnet_cidr[1]
    availability_zone = var.aws_subnet_az[1]
    map_public_ip_on_launch = "false"
    tags = {
      Name = "project-batch-devops-privsub1-az2"
    }
}

# create a internet gateway in vpc 
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.devproject.id

  tags = {
    Name = "project-batch-devops-igw"
  }
}

# # internet gateway attachment with vpc 
# resource "aws_internet_gateway_attachment" "igw_vpc_attach" {
#   internet_gateway_id = aws_internet_gateway.gw.id
#   vpc_id              = aws_vpc.devproject.id 
# }

# create a public route table and assosiate subnet with that 
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.devproject.id 

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# assisate route table with public subnet 
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.publicsubnet1.id
  route_table_id = aws_route_table.public_rt.id
}