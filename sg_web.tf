resource "aws_security_group" "mysg" {
    name = "web-server-sg"
  }

resource "aws_security_group_rule" "allow_webssh" {
    type            = "ingress"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["${aws_eip.mywebeip.public_ip}/32"]

    security_group_id = "${aws_security_group.mysg.id}"
  }

resource "aws_security_group_rule" "allow_webhttp" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  cidr_blocks = ["${aws_eip.mywebeip.public_ip}/32"]

  security_group_id = "${aws_security_group.mysg.id}"
}

resource "aws_security_group_rule" "allow_webhttps" {
  type            = "ingress"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  cidr_blocks = ["${aws_eip.mywebeip.public_ip}/32"]

  security_group_id = "${aws_security_group.mysg.id}"
}
