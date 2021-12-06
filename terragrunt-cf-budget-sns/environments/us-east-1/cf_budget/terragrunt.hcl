include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../modules/cf/"
}

inputs = {
     curency = "USD"
     linkedaccount = "758538164434"
     metric_name   =  "EstimatedCharges"
     email       = "mrdevops1@gmail.com"
 

}
