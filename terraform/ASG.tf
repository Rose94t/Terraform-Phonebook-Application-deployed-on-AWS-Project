resource "aws_autoscaling_group" "app-asg" {
  max_size = 3
  min_size = 1
  desired_capacity = 1
  name = "phonebook-asg"
  health_check_grace_period = 300
  health_check_type = "ELB"
  target_group_arns = [aws_alb_target_group.app-lb-tg.arn]
  vpc_zone_identifier = aws_alb.app-lb.subnets
  launch_template {
    id = aws_launch_template.asg-lt.id
    version = aws_launch_template.asg-lt.latest_version
  }
}