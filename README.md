# GSP101

Google Cloud Essential Skills: Challenge Lab

https://www.qwiklabs.com/focuses/1734?parent=catalog

# Terminal 1
> git clone https://github.com/gablooge/GSP101.git

> cd GSP101

> sudo chmod +x 1.sh

> sudo chmod +x 2.sh

> ./1.sh


if error on `gcloud beta compute ssh`, just retry it 

> ./2.sh


if failed again, ssh manually
> gcloud beta compute ssh --zone "us-central1-a" "apache"

then copy and paste the command below on the terminal

```bash
sudo su -
apt-get update 
apt-get install -y apache2 
cat <<EOF > /var/www/html/index.html
Hello World!
EOF
```

# Terminal 2 for gcloud authentication
gcloud init

