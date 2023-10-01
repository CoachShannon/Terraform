#define the region
variable "aws_region" {
  type    = string
  default = "us-east-1"
}


#define instance ami
variable "ami_id" {
  description = "ami id for instance"
  type        = string
  default     = "ami-03a6eaae9938c858c"
}


#define instance type
variable "project_instance" {
  description = "instance_type"
  type        = string
  default     = "t2.micro"
}

#define s3
variable "bucketname" {
  description = "private jenkins bucket"
  type        = string
  default     = "private-jenkins-bucket-week20project"
}


#define the key pair
variable "key_pair" {
  description = "key_pair"
  type        = string
  default     = "Luitkeypair"
}


#define the VPC id
variable "vpc_id" {
  description = "jenkins_vpc_id"
  type        = string
  default     = "vpc-0f047e9fcd798f8e9"
}


#---