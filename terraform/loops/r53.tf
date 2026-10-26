resource "aws_route53_record" "roboshop" {
  for_each = aws_instance.roboshop # it gives Output of ec2_instances in main.tf
  zone_id  = var.zone_id
  name     = "${each.key}-${var.environment}-${var.project}" # mongodb-dev-roboshop
  type     = "A"
  ttl      = 1
  records  = [each.value.private_ip] # here IP Private address
}

resource "aws_route53_record" "frontend" {
  count   = contains(keys(var.ec2_instances), "frontend") ? 1 : 0 # var.ec2_instances list, if got frontend then create frontend, otherwise no. "contains" is method
  zone_id = var.zone_id
  name    = "${var.project}-${var.environment}.${var.domain_name}" # roboshop-dev-rtdevops.online
  type    = "A"
  ttl     = 1
  records = [lookup(aws_instance.roboshop, "frontend").public_ip] # lookup is the funtion, it brings the key value in the map, "aws_instance.roboshop" is the MAP
}