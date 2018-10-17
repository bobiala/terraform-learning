resource "aws_eip" "myappeip" {
      instance = "${aws_instance.myapp.id}"
      vpc = "true"
    }
