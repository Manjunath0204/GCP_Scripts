# Enabling google API
gcloud services enable compute.googleapis.com

echo **********Enabled Google API*******************

# Create a VPC Network
gcloud compute networks create custom-network --subnet-mode=custom

echo **********VPC Network "custom-network" created Successfully*******************

# Create 2 Subnets
gcloud compute networks subnets create subnet-a --network custom-network --region us-central1 --range 10.2.1.0/24
gcloud compute networks subnets create subnet-b --network custom-network --region us-central1 --range 10.2.2.0/24

echo *****************************2 Subnets, "create subnet-a" and "create subnet-b" created Successfully*************

# Create 5 VM's
gcloud compute instances create instance-1a --zone us-central1-a --machine-type=n1-standard-1 --subnet=subnet-a
gcloud compute instances create instance-1b --zone us-central1-a --machine-type=n1-standard-1 --subnet=subnet-a --no-address
gcloud compute instances create instance-1c --zone us-central1-a --machine-type=n1-standard-1 --subnet=subnet-a --tags=src-ping

gcloud compute instances create instance-2 --zone us-central1-a --machine-type=n1-standard-1 --subnet=subnet-b --tags=deny-ping
gcloud compute instances create instance-3 --zone us-central1-a --machine-type=n1-standard-1 --subnet=subnet-b --no-address

echo **********5 VM's- 3 in "subnet-a and 2 in subnet-b" created Successfully*******************

# firewall to login to VM's

gcloud compute firewall-rules create allow-ssh-custom-nw --direction=INGRESS --priority=1000 --network=custom-network --action=ALLOW --rules=tcp:22 --source-ranges=0.0.0.0/0

echo **********Firewall is Enabled  to access all 5 VMs*******************

# ICMP Allow
gcloud compute firewall-rules create allow-icmp --direction=INGRESS --priority=1000 --network=custom-network --action=ALLOW --rules=icmp --source-ranges=10.2.1.0/24

echo **********"Allowed ICMP Enabled for only subnet-a"*******************


# Deny 2c from 1c
gcloud compute firewall-rules create deny-2c-access --direction=INGRESS --priority=1000 --network=custom-network --action=DENY --rules=icmp --source-tags=src-ping --target-tags=deny-ping

echo *******************"Deny ping from 2c vm to 1c vm"***********************************************












