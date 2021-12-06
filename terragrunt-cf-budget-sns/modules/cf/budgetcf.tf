locals {
  emails = ["${var.email}"]
}

resource "aws_sns_topic" "account_budgets_alarm_topic" {
  name = "account-budget-alarms-topic"

}

resource "aws_sns_topic_policy" "account_budgets_alarm_policy" {
  arn    = aws_sns_topic.account_budgets_alarm_topic.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}

data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    sid    = "AWSBudgetsSNSPublishingPermissions"
    effect = "Allow"

    actions = [
      "SNS:Receive",
      "SNS:Publish"
    ]

    principals {
      type        = "Service"
      identifiers = ["budgets.amazonaws.com"]
    }

    resources = [
      aws_sns_topic.account_budgets_alarm_topic.arn
    ]
  }
}

resource "aws_sns_topic_subscription" "topic_email_subscription" {
  count     = length(local.emails)
  topic_arn = aws_sns_topic.account_budgets_alarm_topic.arn
  protocol  = "email"
  endpoint  = local.emails[count.index]
}


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
  alarm_actions       = ["${aws_sns_topic.account_budgets_alarm_topic.arn}"]

  dimensions = {
    Currency      = "${var.curency}"
    LinkedAccount = "${var.linkedaccount}"
  }
}

