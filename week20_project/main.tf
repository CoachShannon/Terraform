#create the ec2 instance
resource "aws_instance" "jenkins" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  count         = 1

  tags = {
    name = "Jenkins instance"
  }
}
#create a security group
resource "aws_security_group" "week_20_sg" {
  name   = "allow_tls and ssh"
  vpc_id = "vpc-0f047e9fcd798f8e9"

  ingress {
    description      = "TLS from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  ingress {
    description      = "SSH into instance"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls_and_ssh"
  }
}