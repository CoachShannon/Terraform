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

#define bucket name
variable "private_bucket_name" {
  description = "shannonLUITbucket2023"
  type = string
  default = "bucketname"
}
