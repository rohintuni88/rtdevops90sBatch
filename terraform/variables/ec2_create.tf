resource "aws_instance" "roboshop" {
  #count         = 3 # this will genertate 10 instarces with same name.
  count = length(var.ec2_instances)  # so i will take all items in the list ex: 100, 200 etc..
  ami           = var.ami_id
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
  vpc_security_group_ids = [
    aws_security_group.roboshop[count.index].id,
    aws_security_group.common.id
  ]
  #tags                   = var.ec2_tags
  tags = {
    Name = "${var.project}-${var.environment}-${var.ec2_instances[count.index]}" # Interpolation means to mix multiple variables 
  }
}

resource "aws_security_group" "roboshop" {
  count       = length(var.ec2_instances)
  name        = "${var.project}-${var.environment}-${var.ec2_instances[count.index]}"
  description = var.sg_name_desp

  egress {
    from_port   = var.port
    to_port     = var.port
    protocol    = var.portal # allow all Traffic
    cidr_blocks = var.cidr
  }

  #tags = var.sg_tags
  tags = {
    Name = "${var.project}-${var.environment}-${var.ec2_instances[count.index]}" # Interpolation means to mix multiple variables 
  }
}

resource "aws_security_group" "common" {
  name        = "${var.project}-${var.environment}-${var.common-ipv4}"
  description = var.sg_name_desp

  egress {
    from_port   = var.port
    to_port     = var.port
    protocol    = var.portal # allow all Traffic
    cidr_blocks = var.cidr
  }

  #tags = var.sg_tags
  tags = {
    Name = "${var.project}-${var.environment}-${var.common-ipv4}" # Interpolation means to mix multiple variables 
  }
}
