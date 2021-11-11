resource "aws_key_pair" "hjkim_key" {
  key_name   = "hjkim-key"
  public_key = file("../../.ssh/hjkim-key.pub")
  # public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDmZWpPZoi3pK9GEsEPuJl4rfdw+b8LErFkZzA7cPD6pLbQl8nRYodG3eUNvrxn2eFCeENDoNF2Cy2Gv/6UPMnCC7iFwS/QR/q9Fl1Tfs+EAbFrK+EI0bdeWPtCyBELR5XJNi97LbMZnRaMGjCDvSSgNRvTTItdSNwubZVtfKWDebZSZv7UVVqAbrwjAaZ7mlR4yydQ/djhPEWAl/GIOIFXOHfmv2PnSS88eVz0x85E42wbXv/hK6FiC8eD1rgKSGZpb72E/ssl9zeGk+m/iRvUuX4NrBUbsJpVhFoBtakjQJY+uYud9lqQZKvQ3qpC4Asw8g2RbvJ/UZcnM0ibHvEv1vbCQYQhUgPZypSqfmng8rRaWWvjlV63WerB+8k3blKHaz6tQ4Wd6KfVX2OrLc58YvPgIDDMUsQHhh3+iXmwAnVKZQ8ENklhpwohR6lgDVdEsCJ88aWFRhBqK2vHID26zXuptkOYYCBRgaqPE3ZaSyPCSc6+NGMheGzQf845t4E="
}