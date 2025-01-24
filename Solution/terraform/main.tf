provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "my_app" {
  ami           = "ami-xxxxxxxx"  # AMI ID 
  instance_type = "t2.micro"
  key_name      = "my-key-pair"
  security_groups = ["default"]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y nodejs npm
              sudo yum install -y git             
              EOF

  tags = {
    Name = "ReactNativeApp"
  }
}
