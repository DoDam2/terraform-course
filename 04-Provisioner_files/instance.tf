
resource "aws_instance" "example" {
  ami           = "ami-0dad359ff462124ca"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  connection {
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
  tags = {
    Name = "My Instance"
  }

}

resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}
