# YAML to JSON 

A GCP Cloud Function to convert YAML file into a JSON file based on the requirements/case study.

The supported extensions are:
* `.yaml`
* `.json`

## Install

Before we begain, Terraform should be already installed and the required configurations are in place:

Add service account JSON key in the code env. with the name "mygcpservicekey.json".
Enable Cloud Function API and Cloud Build API for your GCP project.
Provide necessary permission to your SA to do activity od CRUD on GCS bucket and also CAN interact with Cloud function and Cloud build api.


## Usage

Converting YAML to JSON is simple through the cloud function.
This will read the source files from the GCS bucket and create the target output JSON files and upload them to the bucket.


## Code overview
The Terraform code is having configuration to:

* It will create a bucket to store and read the YAML and JSON files uploaded on it. Also, the bucket is used to store the code configuration in zip format which is used by the cloud function.
* we are adding the binding of the storage role for the bucket to the SA of the cloud function to be easily able to interact with the bucket and read/write files.
* adding IAM entry for all users to invoke the cloud function.
* We have terraform code to create a zip file on the local system with the code file which will get executed when the cloud function will get triggered. and also the requirement file of the packages required in the code. also after creation, we have another terraform code to upload that created zip file on the GCS bucket.
* if we get any error on the cloud function's code execution. the function will return the error on the same page after the execution of the code. else it will show the successful msg.
