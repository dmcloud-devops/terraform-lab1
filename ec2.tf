resource "aws_instance" "docker" {
  ami                         = "ami-0bcc094591f354be2"
  instance_type               = "t3.medium"
  associate_public_ip_address = true
  key_name                    = aws_key_pair.setup.key_name
  vpc_security_group_ids      = ["${aws_security_group.lab1_internal.id}"]
  root_block_device {
    volume_type = "gp2"
    volume_size = 20
  }
  tags = {
    Name = "docker1"
  }
}

output "public_dns" {
  value       = ["${aws_instance.docker.public_dns}"]
}