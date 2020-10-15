resource "aws_lb_target_group" "target_docker" {  
  name     = "tg-docker"  
  port     = "80"  
  protocol = "HTTP"  
  vpc_id   = var.vpc_id

  health_check {    
    healthy_threshold   = 2    
    unhealthy_threshold = 5    
    timeout             = 5    
    interval            = 10    
    path                = "/"    
    port                = "80"  
  }
}

resource "aws_lb_target_group_attachment" "attach_docker" {
  target_group_arn = aws_lb_target_group.target_docker.arn
  target_id        = aws_instance.docker.id
  port             = 80
}

resource "aws_lb" "alb_docker" {  
  internal           = false
  load_balancer_type = "application"
  subnets         = var.vpc_subnet
  security_groups = [aws_security_group.lab1_external.id]
  tags = {
    Name = "alb_docker"
  }   
}

resource "aws_lb_listener" "listener_docker" {
  load_balancer_arn = aws_lb.alb_docker.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}

resource "aws_lb_listener_rule" "site_teste" {
  listener_arn = aws_lb_listener.listener_docker.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_docker.arn
  }

  condition {
    host_header {
      values = ["teste.dmops.com.br"]
    }
  }
}