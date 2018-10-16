resource "aws_security_group" "myappsg" {
    name = "app-server-sg"
  }

resource "aws_security_group_rule" "allow_appssh" {
    type            = "ingress"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks = ["${aws_eip.myappeip.public_ip}/32"]

    security_group_id = "${aws_security_group.myappsg.id}"
  }

resource "aws_security_group_rule" "allow_apphttp" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  cidr_blocks = ["${aws_eip.myappeip.public_ip}/32"]

  security_group_id = "${aws_security_group.myappsg.id}"
}

resource "aws_security_group_rule" "allow_apphttps" {
  type            = "ingress"
  from_port       = 443
  to_port         = 443
  protocol        = "tcp"
  cidr_blocks = ["${aws_eip.myappeip.public_ip}/32"]

  security_group_id = "${aws_security_group.myappsg.id}"
}
