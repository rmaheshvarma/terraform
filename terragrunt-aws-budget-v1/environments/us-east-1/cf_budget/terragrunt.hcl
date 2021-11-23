include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../aws-budget-alarms/"
}

inputs = {
     account_name        = "Dev"
     account_budget_limit = 20

  services = {
    EC2 = {
      budget_limit = 10.25
    }
  }

  notifications = {
    warning = {
      comparison_operator = "GREATER_THAN"
      threshold           = 100
      threshold_type      = "PERCENTAGE"
      notification_type   = "ACTUAL"
    }
  }

  create_slack_integration = false
  slack_workspace_id       = ""
  slack_channel_id         = ""

  tags = {
    Environment = "Dev"
  }



}

