resource "aws_instance" "web" {
  count                       = 2
  ami                         = "ami-0c02fb55956c7d316" # Amazon Linux 2 (check region)
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public[count.index].id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              echo "<h1>Hello from EC2 Instance $(hostname)</h1>" > /var/www/html/index.html
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              EOF

  tags = {
    Name = "WebServer-${count.index + 1}"
  }
}

