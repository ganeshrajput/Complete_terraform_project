#!/bin/bash

sudo su - root
apt-get update
apt-get install apache2 -y
apt-get update
sudo apt install default-jre -y
cd /var/www/html
rm index.html
cd /root
git clone https://github.com/ganeshrajput/mobile-shop-backend.git
cp -rf mobile-shop-backend/* /var/www/html/


