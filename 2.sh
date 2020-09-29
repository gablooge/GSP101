#!/bin/bash
echo "if failed, ssh manually"
gcloud beta compute ssh --zone "us-central1-a" "apache" << EOF
sudo su -
apt-get update 
apt-get install -y apache2 
cat <<EOF > /var/www/html/index.html
Hello World!
EOF



