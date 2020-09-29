#!/bin/bash
gcloud auth revoke --all

while [[ -z "$(gcloud config get-value core/account)" ]]; 
do echo "waiting login" && sleep 2; 
done

while [[ -z "$(gcloud config get-value project)" ]]; 
do echo "waiting project" && sleep 2; 
done


gcloud compute instances create apache --zone=us-central1-a --machine-type=n1-standard-1 --tags http-server --metadata startup-script='#! /bin/bash
sudo su -
apt-get update 
apt-get install -y apache2 
cat <<EOF > /var/www/html/index.html
Hello World!
EOF'

gcloud compute firewall-rules create default-allow-http --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server

echo "if failed, ssh manually"
gcloud beta compute ssh --zone "us-central1-a" "apache" << EOF
sudo su -
apt-get update 
apt-get install -y apache2 
cat <<EOF > /var/www/html/index.html
Hello World!
EOF



