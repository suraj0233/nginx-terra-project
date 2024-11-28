# EC2 instance For Nginx setup
resource "aws_instance" "nginx-server" {
    ami = "ami-0dee22c13ea7a9a67"
    instance_type               = "t2.micro"
    availability_zone = "ap-south-1a"
    subnet_id                   = aws_subnet.public-subnet.id
    vpc_security_group_ids      = [aws_security_group.nginx-sg.id]
    associate_public_ip_address = true

    user_data = <<-EOF
                #!/bin/bash
                sudo apt install nginx -y
                sudo systemctl start nginx
                EOF

  tags = {
    Name = "Nginx-Server"
  }
}
