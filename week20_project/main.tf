#create the ec2 instance
resource "aws_instance" "jenkins" {
  ami           = var.ami_id
  instance_type = var.project_instance
  count         = 1
  key_name      = var.key_pair
  user_data     = file("jenkins_download.sh")

  tags = {
    name = "Jenkins instance"
  }
  vpc_security_group_ids = [aws_security_group.week_20_sg.id]
}
#create a security group
resource "aws_security_group" "week_20_sg" {
  name   = "allow_tls and ssh"
  vpc_id = var.vpc_id

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