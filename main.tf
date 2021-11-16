# Main

resource "aws_vpc" "developer_vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_hostnames = true

    tags = {
      name = "developer_vpc"
 }

}

# public subnet

resource "aws_subnet" "developer_pub_subnet" {
    vpc_id = aws_vpc.developer_vpc.id
    cidr_block = "10.0.30.0/24"
    availability_zone = "eu-west-2a"

    tags = {
      name = "developer_pub_subnet"
    }
  
}

# Private subnet

resource "aws_subnet" "developer_private_subnet" {
    vpc_id = aws_vpc.developer_vpc.id
    cidr_block = "10.0.31.0/24"
    availability_zone = "eu-west-2a"

    tags = {
      name = "developer_private_subnet"
    }
}


# Public route table
resource "aws_route_table" "developer_public_route_table" {
    vpc_id = aws_vpc.developer_vpc.id

    tags = {
      name = "developer_route_table"
    }
}

# public route association

resource "aws_route_table_association" "developer_public_association" {
    subnet_id = aws_subnet.developer_pub_subnet.id
    route_table_id = aws_route_table.developer_public_route_table.id
  
}

# private route table
resource "aws_route_table" "developer_private_route_table" {
    vpc_id = aws_vpc.developer_vpc.id

    tags = {
      name = "developer_private_route_table"
    }
}

# private route association

resource "aws_route_table_association" "developer_private_route_association" {
    subnet_id = aws_subnet.developer_private_subnet.id
    route_table_id = aws_route_table.developer_private_route_table.id
}