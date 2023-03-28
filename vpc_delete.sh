# Deleting of the VPC

gcloud compute firewall-rules delete mycustvpc-allow-icmp --quiet

gcloud compute firewall-rules delete mycustvpc-allow-custom --quiet

gcloud compute firewall-rules delete mycustvpc-allow-rdp --quiet

gcloud compute firewall-rules delete mycustvpc-allow-ssh --quiet

gcloud compute networks delete mycustvpc --quiet
