resource "aws_key_pair" "my1key" {
  key_name   = "my1key"
  public_key = "${file("my1key.pub")}"
}


resource "aws_launch_configuration" "lc1" {
  name          = "lc1"
  image_id      = "ami-07ebfd5b3428b6f4d"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.my1key.key_name}"
  associate_public_ip_address = "true"
  user_data = <<EOF
 {
     #!/bin/bash
     sudo apt update
     sudo apt install nginx -y
 }
 EOF
connection {
    user = "ubuntu"
    private_key = "${file("my1key")}"
  }

lifecycle {
    create_before_destroy = true
  }
}


