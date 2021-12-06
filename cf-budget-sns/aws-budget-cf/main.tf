provider "aws" {
    region = "us-east-1"
  
}

module "aws-budget-cf-alarm" {
    source = "../modules/cf"
   
     curency = "USD"
     linkedaccount = "758538164434"
     metric_name = "EstimatedCharges"
     email       = "mrdevops1@gmail.com"


  
}
