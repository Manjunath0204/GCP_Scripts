# Enabling API service
gcloud services enable compute.googleapis.com

# Deleting of the firewall-rules

gcloud compute firewall-rules delete deny-2c-access --quiet

gcloud compute firewall-rules delete allow-icmp --quiet

gcloud compute firewall-rules delete allow-ssh-custom-nw --quiet

# Delete VM Instances
gcloud compute instances delete instance-1a --zone us-central1-a --quiet
gcloud compute instances delete instance-1b --zone us-central1-a --quiet
gcloud compute instances delete instance-1c --zone us-central1-a --quiet
gcloud compute instances delete instance-2 --zone us-central1-a --quiet
gcloud compute instances delete instance-3 --zone us-central1-a --quiet

# Delete Network 
gcloud compute networks subnets delete subnet-a --region us-central1 --quiet
gcloud compute networks subnets delete subnet-b --region us-central1 --quiet
gcloud compute networks delete custom-network --quiet


