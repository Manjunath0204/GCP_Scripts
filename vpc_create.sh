# creating a Auto mode vpc

## gcloud compute networks create myvpc --project=project-1-381609 --subnet-mode=auto --mtu=1460 --bgp-routing-mode=regional

## gcloud compute firewall-rules create myvpc_firewal --network myvpc --allow tcp,udp,icmp
## gcloud compute firewall-rules create myvpc_fireal --network myvpc --allow tcp:22,tcp:3389,icmp
gcloud compute networks create mycustvpc --subnet-mode=auto --mtu=1460 --bgp-routing-mode=regional

gcloud compute firewall-rules create mycustvpc-allow-custom --network=projects/project-1-381609/global/networks/mycustvpc --direction=INGRESS --priority=65534 --source-ranges=10.128.0.0/9 --action=ALLOW --rules=all

gcloud compute firewall-rules create mycustvpc-allow-icmp --network=projects/project-1-381609/global/networks/mycustvpc --direction=INGRESS --priority=65534 --source-ranges=0.0.0.0/0 --action=ALLOW --rules=icmp

gcloud compute firewall-rules create mycustvpc-allow-rdp --network=projects/project-1-381609/global/networks/mycustvpc --direction=INGRESS --priority=65534 --source-ranges=0.0.0.0/0 --action=ALLOW --rules=tcp:3389

gcloud compute firewall-rules create mycustvpc-allow-ssh --network=projects/project-1-381609/global/networks/mycustvpc --direction=INGRESS --priority=65534 --source-ranges=0.0.0.0/0 --action=ALLOW --rules=tcp:22
