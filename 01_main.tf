provider "aws" {
  region = var.region
}

resource "aws_key_pair" "hjkim_key" {
  key_name   = var.key
  public_key = file("../../.ssh/hjkim-key.pub")
  # public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDmZWpPZoi3pK9GEsEPuJl4rfdw+b8LErFkZzA7cPD6pLbQl8nRYodG3eUNvrxn2eFCeENDoNF2Cy2Gv/6UPMnCC7iFwS/QR/q9Fl1Tfs+EAbFrK+EI0bdeWPtCyBELR5XJNi97LbMZnRaMGjCDvSSgNRvTTItdSNwubZVtfKWDebZSZv7UVVqAbrwjAaZ7mlR4yydQ/djhPEWAl/GIOIFXOHfmv2PnSS88eVz0x85E42wbXv/hK6FiC8eD1rgKSGZpb72E/ssl9zeGk+m/iRvUuX4NrBUbsJpVhFoBtakjQJY+uYud9lqQZKvQ3qpC4Asw8g2RbvJ/UZcnM0ibHvEv1vbCQYQhUgPZypSqfmng8rRaWWvjlV63WerB+8k3blKHaz6tQ4Wd6KfVX2OrLc58YvPgIDDMUsQHhh3+iXmwAnVKZQ8ENklhpwohR6lgDVdEsCJ88aWFRhBqK2vHID26zXuptkOYYCBRgaqPE3ZaSyPCSc6+NGMheGzQf845t4E="
}

resource "aws_vpc" "hjkim_vpc" {
  cidr_block = var.cidr_main
  tags = {
    "Name" = "${var.name}-vpc"
  }
}

# 가용영역 public subnet
resource "aws_subnet" "hjkim_pub" {
  count             = length(var.cidr_public) #2
  vpc_id            = aws_vpc.hjkim_vpc.id
  cidr_block        = var.cidr_public[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    Name = "${var.name}-pub${var.ava[count.index]}"
  }
}

# 가용영역 private subnet
resource "aws_subnet" "hjkim_pri" {
  count             = length(var.cidr_private)
  vpc_id            = aws_vpc.hjkim_vpc.id
  cidr_block        = var.cidr_private[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    Name = "${var.name}-pri${var.ava[count.index]}"
  }
}

# 가용영역 private DB subnet
resource "aws_subnet" "hjkim_pridb" {
  count             = length(var.cidr_privatedb)
  vpc_id            = aws_vpc.hjkim_vpc.id
  cidr_block        = var.cidr_privatedb[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    Name = "${var.name}-pridb${var.ava[count.index]}"
  }
}