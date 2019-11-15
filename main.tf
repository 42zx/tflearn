provider "aws" {
  region = "eu-west-2"
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol =    "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami           = "ami-ea4ba68d"
  instance_type = "t2.micro"
  key_name = "CMKeyPair"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

    user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
      Name = "cm-terraform-example"
    }
}
