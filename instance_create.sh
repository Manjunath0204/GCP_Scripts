# Enableing google API
# gcloud services enable compute.googleapis.com

# Craeting a VM Instances from shell script

gcloud compute instances create testvm \
    --zone=asia-southeast1-b \
    --machine-type=f1-micro \
    --network-interface=network-tier=PREMIUM,subnet=default \
    --tags=http-server,https-server
