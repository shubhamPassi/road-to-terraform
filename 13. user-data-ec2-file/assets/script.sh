#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl enable --now nginx
echo "weclome to shubham's site" > /var/www/html/index.html