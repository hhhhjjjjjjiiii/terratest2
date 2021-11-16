variable "name" {
  type = string
  default = "hjkim"  
}

variable "region" {
  type = string
  default = "ap-northeast-2"
}

variable "ava" {
  type = list(string)
  default = ["a","c"]
}

variable "key" {
  type = string
  default = "hjkim-key"  
}

variable "cidr_main" {
  type = string
  default = "10.0.0.0/16"
}

variable "cidr_public" {
  type = list(string)
  default = ["10.0.0.0/24","10.0.2.0/24"]
}

variable "cidr_private" {
  type = list(string)
  default = ["10.0.1.0/24","10.0.3.0/24"]
}

variable "cidr_privatedb" {
  type = list(string)
  default = ["10.0.4.0/24","10.0.5.0/24"]
}

variable "cidr_route" {
  type = string
  default = "0.0.0.0/0"
}

variable "cidr_ip6" {
  type = string
  default = "::/0"
}
variable "protocol_tcp" {
  type = string
  default = "tcp"
}

variable "protocol_HTTP" {
  type = string
  default = "HTTP"
}

variable "protocol_icmp" {
  type = string
  default = "icmp"
}

variable "protocol_min" {
  type = number
  default = -1
}

variable "port_ssh" {
  type = number
  default = 22
}

variable "port_http" {
  type = number
  default = 80
}

variable "port_mysql" {
  type = number
  default = 3306
}

variable "port_all" {
  type = number
  default = 0
}

/*
variable "private_ip" {
  type = string
  default = "10.0.0.11"
}
*/

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "load_type" {
  type = string
  default = "application"
}

variable "storage_size" {
  type = number
  default = 20
}

variable "storage_type" {
  type = string
  default = "gp2"
}

variable "rds_engine" {
  type = string
  default = "mysql"
}

variable "rds_ins_type" {
  type = string
  default = "db.t2.micro"
}

variable "rds_name" {
  type = string
  default = "test"
}

variable "rds_username" {
  type = string
  default = "admin"
}

variable "rds_password" {
  type = string
  default = "It12345!"
}