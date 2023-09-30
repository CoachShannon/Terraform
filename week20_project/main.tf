#create the ec2 instance
resource "aws_instance" "jenkins" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  count         = 1
  key_name = 

  tags = {
    name = "Jenkins instance"
  }
}
#create a security group
resource "aws_security_group" "week_20_sg" {
  name   = "allow_tls and ssh"
  vpc_id = "vpc-0f047e9fcd798f8e9"

  ingress {
    description = "TLS from VPC"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH into instance"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls_and_ssh"
  }
}

resource "null_resource" "name" {

  connection {
    type        = "ssh"
    user        = "user"
    private_key = file("C:/Users/breko/OneDrive/Stuff_for_LUIT/Luitkeypair.pem")
    host        = aws_instance.jenkins.public_ip
  }

}