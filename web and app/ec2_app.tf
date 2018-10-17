resource "aws_instance" "myapp" {
  ami = "ami-0c21ae4a3bd190229"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.mysg.name}"]
  associate_public_ip_address = "false"

tags {
    Name = "app-server"
  }
}
