resource "aws_security_group" "hjkim_sg" {
  name        = "allow basic"
  description = "Allow http,ssh,sql,icmp"
  vpc_id      = aws_vpc.hjkim_vpc.id

  ingress = [
    {
      description      = "Allow HTTP"
      from_port        = var.port_http
      to_port          = var.port_http
      protocol         = var.protocol_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_ip6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = "Allow SSH"
      from_port        = var.port_ssh
      to_port          = var.port_ssh
      protocol         = var.protocol_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_ip6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = "Allow SQL"
      from_port        = var.port_mysql
      to_port          = var.port_mysql
      protocol         = var.protocol_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_ip6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = "Allow ICMP"
      from_port        = var.port_all
      to_port          = var.port_all
      protocol         = var.protocol_icmp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_ip6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]

  egress = [
    {
      description      = "Allow outbound"
      from_port        = var.port_all
      to_port          = var.port_all
      protocol         = var.protocol_min
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_ip6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]

  tags = {
    Name = "${var.name}-sg"
  }
}

data "aws_ami" "amzn" {
  most_recent = true
  
  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}


resource "aws_instance" "hjkim_weba" {
  ami                    = data.aws_ami.amzn.id   #"ami-04e8dfc09b22389ad"
  instance_type          = var.instance_type
  key_name               = var.key
  availability_zone      = "${var.region}${var.ava[0]}"
  # private_ip             = var.private_ip
  subnet_id              = aws_subnet.hjkim_pub[0].id
  vpc_security_group_ids = [aws_security_group.hjkim_sg.id]
  user_data              = file("./install.sh")
}

resource "aws_eip" "hjkim_weba_ip" {
  vpc                       = true
  instance                  = aws_instance.hjkim_weba.id
  # associate_with_private_ip = var.private_ip
  depends_on = [
    aws_internet_gateway.hjkim_ig
  ]
}

output "public_ip" {
  value = aws_instance.hjkim_weba.public_ip
}
