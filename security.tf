resource "aws_key_pair" "setup" {
  key_name   = "setup-key"
  public_key = var.public_key
}

resource "aws_security_group" "lab1_internal" {
  name        = "sg_lab1_internal"
  description = "Allow SSH from specific ip address"

  ingress {
    description = "Home"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["170.244.222.169/32"]
  }

  ingress {
    description = "Local HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  ingress {
    description = "Local HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_lab1_internal"
  }
}

resource "aws_security_group" "lab1_external" {
  name        = "sg_lab1_external"
  description = "Allow HTTP and HTTPS from internet"

  ingress {
    description = "External HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "External HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_lab1_external"
  }
}


resource "aws_security_group" "lab1_internal_mysql" {
  name        = "sg_lab1_internal_mysql"
  description = "Allow MySQL from specific ip address"

  ingress {
    description = "Home Access"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["170.244.222.169/32"]
  }

  ingress {
    description = "Local Access"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_lab1_internal_mysql"
  }
}