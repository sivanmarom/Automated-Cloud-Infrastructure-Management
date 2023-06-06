resource "aws_sns_topic" "notification_topic" {
  name = "cpu-alarm-notification-topic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.notification_topic.arn
  protocol  = "email"
  endpoint  = "sivmarom@gmail.com"
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  count               = length(var.agents-ids)
  alarm_name          = "cpu-utilization-alarm-${var.agents-ids[count.index]}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80

  alarm_description = "This alarm is triggered if CPU utilization exceeds 80%."

  dimensions = {
    InstanceId = var.agents-ids[count.index]
  }

  alarm_actions = [aws_sns_topic.notification_topic.arn]
}