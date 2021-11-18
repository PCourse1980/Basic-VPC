# Main

resource "aws_vpc" "developer_vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_hostnames = true

    tags = {
      name = "developer_vpc"
 }

}

# public subnet

resource "aws_subnet" "developer_public_subnet" {
    vpc_id = aws_vpc.developer_vpc.id
    cidr_block = var.public_cidr
    availability_zone = var.public_AZ

    tags = {
      name ="developer_public_subnet"
    }
  
}

# Private subnet

resource "aws_subnet" "developer_private_subnet" {
    vpc_id = aws_vpc.developer_vpc.id
    cidr_block = var.private_cidr
    availability_zone = var.private_AZ

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
    subnet_id = aws_subnet.developer_public_subnet.id
    route_table_id = aws_route_table.developer_public_route_table.id
  
}

# private route table
resource "aws_route_table" "developer_private_route_table" {
    vpc_id =aws_vpc.developer_vpc.id

    tags = {
      name = "developer_private_route_table"
    }
}

# private route association

resource "aws_route_table_association" "developer_private_route_association" {
    subnet_id = aws_subnet.developer_private_subnet.id
    route_table_id = aws_route_table.developer_private_route_table.id
}


#Internet Gateway

resource "aws_internet_gateway" "devoloper_internet_Gateway" {
  vpc_id = aws_vpc.developer_vpc.id

  tags = {
    name = "developer_internet_Gateway"
  }
  
}

# internet Gateway association with public route table

resource "aws_route" "devloper_IGW_assoc_with_public_RT" {
  route_table_id     = aws_route_table.developer_public_route_table.id
  gateway_id         = aws_internet_gateway.devoloper_internet_Gateway.id
  destination_cidr_block   = var.IGW_destionation_cidr_block
  depends_on         = [aws_route_table.developer_public_route_table]

}
