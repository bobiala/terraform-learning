resource "aws_instance" "myweb" {
  ami = "ami-0c21ae4a3bd190229"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.mywebsg.name}"]
  associate_public_ip_address = "false"
  key_name = "kpname"

tags {
    Name = "web-server"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras -y install epel",
      "sudo amazon-linux-extras -y install nginx1.12",
      "sudo service nginx"
    ]
    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = "${file("./your_keypair.pem")}"
    }
  }
}
