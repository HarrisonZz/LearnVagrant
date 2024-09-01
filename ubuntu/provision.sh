#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y apache2

sudo systemctl start apache2
sudo systemctl enable apache2

sudo echo "<html><body><h1>Hollo World !</h1></body></html>" > /var/www/html/index.html

sudo systemctl restart apache2
