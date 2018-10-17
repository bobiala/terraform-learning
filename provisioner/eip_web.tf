resource "aws_eip" "mywebeip" {
      instance = "${aws_instance.myweb.id}"
      vpc = "true"
    }
