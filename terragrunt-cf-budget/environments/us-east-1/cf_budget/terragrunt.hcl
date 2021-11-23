include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../modules/cf/"
}

inputs = {
     curency = "USD"
     linkedaccount = "758538164434"
     alarm_actions =  "arn:aws:sns:us-east-1:758538164434:budget"
     metric_name   =  "EstimatedCharges"

}
