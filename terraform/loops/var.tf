# variable "type_of_the_variable" {
# type = string
# dedefault = "value" 
# }

variable "instance_type" {
  type        = string
  description = "type of the varibale"
  default     = "t3.micro" # if you give t3.large, then validation throws error
  validation {
    condition     = contains(["t3.micro", "t3.small"], var.instance_type)
    error_message = "Instance type should be t3.micro or t3.samll"
  }
}

variable "ami_id" {
  type        = string
  description = "ami from DevOps-Redhat"
  default     = "ami-0055977a6e828a4f4"
}

# variable "ec2_tags" {
#   type = map(any)
#   default = {
#     Name : "terraform_ec2_demo-1"
#     Environment = "Dev"
#     Project     = "Practice"
#   }
# }

variable "sg_name" {
  type    = string
  default = "aws_security_demo"
}

variable "sg_name_desp" {
  type    = string
  default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "port" {
  type    = number
  default = 0
}

variable "portal" {
  type    = string
  default = "-1"
}

variable "cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

# variable "sg_tags" {
#   type = map(string)
#   default = {
#     Name : "security_demo"
#     Environment = "Dev"
#     Project     = "Practice"
#   }
# }

variable "environment" {
  type    = string
  default = "dev"
}

variable "ec2_instances" {
  default = {
    mongodb = {
      "instance_type" = "t3.micro"
    }
    reddis = {
      "instance_type" = "t3.micro"
    }
    mysql = {
      "instance_type" = "t3.micro"
    }
    frontend = {
      "instance_type" = "t3.micro"
    }
  }
  # , "payment", "reddis", "user", "catalouge", "cart", "shipping", "frontend"]  # 10 components
  type = map(any)
}

variable "project" {
  default = "roboshop"
  type    = string
}

variable "common-ipv4" {
  default = "common"
  type    = string
}
variable "domain_name" {
  default = "rtdevops.online"
  type    = string
}
variable "zone_id" {
  default = "Z079173622ZFKOVAG4QDL"
  type    = string
}
variable "ttl" {
  default = 1
}