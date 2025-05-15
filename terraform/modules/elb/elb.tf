resource "aws_lb" "elb" {
  name = "elb"
  internal = false
  load_balancer_type = "application"
  security_groups = [ var.sg-elb ]
  subnets = [ var.main-subnet-id, var.secondary-subnet-id ]
}

resource "aws_lb_target_group" "main-tg" {
  name = "main-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  target_type = "instance"   
}

resource "aws_lb_target_group" "secondary-tg" {
  name = "sec-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  target_type = "instance"   
}

resource "aws_lb_listener" "name" {
  load_balancer_arn = aws_lb.elb.arn
  port = 80
  default_action {
    type = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.main-tg.arn
        weight = 50
      }
      target_group {
        arn    = aws_lb_target_group.secondary-tg.arn
        weight = 50
      }
    }
  }
}

resource "aws_lb_target_group_attachment" "main-attch-ec2" {
  target_group_arn = aws_lb_target_group.main-tg.arn
  target_id = var.ec2-id
}

resource "aws_lb_target_group_attachment" "sec-attch-sec" {
  target_group_arn = aws_lb_target_group.secondary-tg.arn
  target_id = var.secondary-id
}