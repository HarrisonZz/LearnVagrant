#!/usr/bin/env bash

sudo yum update -y
sudo yum install sudo httpd zip unzip vim wget -y

sudo systemctl start httpd
sudo systemctl enable httpd
