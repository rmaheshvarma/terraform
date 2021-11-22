provider "aws" {
    region = "us-east-1"
  
}

module "aws-budget-cf-alarm" {
    source = "../modules/cf"
   
     curency = "USD"
     linkedaccount = "758538164434"
     alarm_actions = "arn:aws:sns:us-east-1:758538164434:budget"
     metric_name = "EstimatedCharges"


  
}
