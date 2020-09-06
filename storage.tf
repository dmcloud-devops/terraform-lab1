resource "aws_s3_bucket" "estaticos-site" {
  bucket = "estaticos-site"
  acl    = "private"

  tags = {
    Name        = "Estaticos do Site"
  }
}