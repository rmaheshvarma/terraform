resource "aws_cloudwatch_metric_alarm" "account-billing-alarm" {
  alarm_name          = "account-billing-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "${var.metric_name}"
  namespace           = "AWS/Billing"
  period              = "21600"
  statistic           = "Maximum"
  threshold           = "100"
  alarm_description   = "Billing alarm by account"
  alarm_actions       = ["${var.alarm_actions}"]

  dimensions = {
    Currency      = "${var.curency}"
    LinkedAccount = "${var.linkedaccount}"
  }
}

