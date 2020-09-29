#!/bin/bash
gcloud compute instances create apache --zone=us-central1-a --machine-type=n1-standard-1 --tags http-server 

gcloud compute firewall-rules create default-allow-http --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server

echo "if failed, ssh manually"
gcloud beta compute ssh --zone "us-central1-a" "apache" << EOF
sudo su -
apt-get update 
apt-get install -y apache2 
cat <<EOF > /var/www/html/index.html
Hello World!
EOF



