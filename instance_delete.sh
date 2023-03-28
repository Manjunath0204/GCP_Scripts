#Enabling API service
gcloud services enable compute.googleapis.com

# Delete VM Instances
gcloud compute instances delete testvm --zone=asia-southeast1-b
