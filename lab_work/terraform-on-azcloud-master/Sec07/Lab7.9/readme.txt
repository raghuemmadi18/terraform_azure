# Terraform 15 has aliases
# You can deploy the code to multiple accounts/tenents and as well as multiple subscriptions in the same account/tenent.
# All you specify a tenent id for different accounts/tenents along with subscription id.
# If same account/tenent just provide subscriptions in which you want to deploy the IaC. 


az account set -s <name-of-subscription>
az account show
az account list
terraform init
terraform plan
terraform apply -auto-approve
terraform output -raw pkey
