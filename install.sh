## Creating a VPC,Subnet, Firewall and also Instances one by one*************************

# Enabling API
gcloud services enable compute.googleapis.com
echo "Enabled API"

# Creating a VPC name vpc-demo
gcloud compute networks create vpc-demo --subnet-mode custom

echo "Created vpc-demo using custom mode"

# creating subnet1 with vpc-demo-subnet1 in us-central1
gcloud beta compute networks subnets create vpc-demo-subnet1 --network vpc-demo --range 10.1.1.0/24 --region us-central1
echo "vpc-demo-subnet1 successfully created"

# creating subnet2 eith vpc-demo-subnet2 in us-east1
gcloud beta compute networks subnets create vpc-demo-subnet2 --network vpc-demo --range 10.2.1.0/24 --region us-east1
echo "vpc-demo-subnet2 successfully created"

# applying firewall rule
gcloud compute firewall-rules create vpc-demo-allow-internal --network vpc-demo --allow tcp:0-65535,udp:0-65535,icmp --source-ranges 10.0.0.0/8

gcloud compute firewall-rules create vpc-demo-allow-ssh-icmp --network vpc-demo --allow tcp:22,icmp --source-ranges 0.0.0.0/0
echo "firewall rule applied successfully"

# VM instances creating
gcloud compute instances create vpc-demo-instance1 --zone us-central1-b --subnet vpc-demo-subnet1 --machine-type f1-micro 
gcloud compute instances create vpc-demo-instance2 --zone us-central1-b --subnet vpc-demo-subnet1 --machine-type f1-micro
gcloud compute instances create vpc-demo-instance3 --zone us-central1-b --subnet vpc-demo-subnet1 --machine-type f1-micro --no-address

gcloud compute instances create vpc-demo-instance-a --zone us-east1-b --subnet vpc-demo-subnet2 --machine-type f1-micro 
gcloud compute instances create vpc-demo-instance-b --zone us-east1-b --subnet vpc-demo-subnet2 --machine-type f1-micro --no-address

echo "Total 5 vm's created successfully"
