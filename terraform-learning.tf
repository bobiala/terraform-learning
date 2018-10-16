provider "aws" {
  region     = "eu-west-1"
  access_key = "ACCESSKEY"
  secret_key = "SECRETKEY"
}

resource "aws_instance" "myweb" {
  ami = "ami-0c21ae4a3bd190229"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.mysg.name}"]
  associate_public_ip_address = "false"

tags {
    Name = "ForTerraformLearning1"
  }
}

resource "aws_security_group" "mysg" {
    name = "web-server-sg"
  }

resource "aws_security_group_rule" "allow_ssh" {
    type            = "ingress"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["${aws_eip.myeip.public_ip}/32"]

    security_group_id = "${aws_security_group.mysg.id}"
  }

resource "aws_security_group_rule" "allow_http" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  cidr_blocks = ["${aws_eip.myeip.public_ip}/32"]

  security_group_id = "${aws_security_group.mysg.id}"
}

resource "aws_security_group_rule" "allow_https" {
  type            = "ingress"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  cidr_blocks = ["${aws_eip.myeip.public_ip}/32"]

  security_group_id = "${aws_security_group.mysg.id}"
}

resource "aws_eip" "myeip" {
      instance = "${aws_instance.myweb.id}"
      vpc = "true"
    }
