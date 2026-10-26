resource "aws_route53_record" "roboshop" {
  count   = length(var.ec2_instances)
  zone_id = var.zone_id
  name    = "${var.ec2_instances[count.index]}-${var.environment}-${var.project}" # mongodb-dev-roboshop
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop[count.index].private_ip] # here IP Private address
}

resource "aws_route53_record" "frontend" {
  count   = contains(var.ec2_instances, "frontend") ? 1 : 0     # var.ec2_instances list, if got frontend then create frontend, otherwise no. "contains" is method
  zone_id = var.zone_id
  name    = "${var.project}-${var.environment}.${var.domain_name}" # roboshop-dev-rtdevops.online
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop[index(var.ec2_instances, "frontend")].public_ip] # here IP Public IP, index is the funtion.
}