project_id = "quiet-engine-379816"
bucket_name= "yaml-to-json"
service_account ="tf-practice@quiet-engine-379816.iam.gserviceaccount.com"
region  = "us-central1"
zone    = "us-central1-c"
timeout = 300
available_memory_mb = 2048
trigger_http = true


# let suppose you have 2 or more tfvars files one is dev.tfvars and other is prod.tfvars both have same varibles but with diffrent values.
# now you want that tf apply should go with dev.tfvars not include any other tfvars files.
# in the case you should below command to insure your tf apply go with the file you want only to get selected in apply
# terraform apply -var-file dev.tfvars


# if you want to set variables in you system enviroment rather then in tfvars file you can do it by below
# TF_VAR_<varible_name>=<value_for_varible> terraform apply
#in above case you have to create the varible as well in the tf file(variable.tf etc.) but not have to add it's value in tfvars

#Varible defination Precedence is the order how Terraform takes or read the varibles.
# * Enviroment Variables
# * The "terraform.tfvars" file, if present
# * The "terraform.tfvars.json" file, if present
# * Any " *.auto.tfvars" or " *.auto.tfvars.json" files, processed in lexical order of their filenames.
# Any "-var" and "-var-file" options on the command line. in order they are provided. ( This includes variables set by a Terraform Cloud workspace)
