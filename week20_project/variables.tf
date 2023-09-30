variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ami_id" {
  description = "ami id for instance"
  type        = string
  default     = "ami-03a6eaae9938c858c"
}

variable "project_instance" {
  description = "instance_type"
  type        = string
  default     = "t2.micro"
}

variable "bucketname" {
  description = "private jenkins bucket"
  type        = string
  default     = "private-jenkins-bucket-week20project"
}
variable "key_pair" {
  description = "key_pair"
  type        = string
  default     = "Luitkeypair"
}
variable "vpc_id" {
  description = "jenkins_vpc_id"
  type        = string
  default     = "vpc-0f047e9fcd798f8e9"
}