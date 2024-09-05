#!/usr/bin/env bash

TARGET="https://www.tooplate.com/zip-templates/2107_new_spot.zip"
ZIP_FILE="website.zip"
TEMP_PATH="/tmp/website"

sudo yum update -y
sudo yum install sudo httpd zip unzip vim wget -y
if systemctl is-enabled httpd &> /dev/null; then
    echo "httpd have been started"
else
    sudo systemctl start httpd
    sudo systemctl enable httpd
fi


if [ -n "${TARGET}" ]; then
  sudo wget -O ${ZIP_FILE} ${TARGET}
  sudo unzip -d ${TEMP_PATH} ${ZIP_FILE}
  sudo rm -rf /var/www/html/* && sudo find ${TEMP_PATH} -mindepth 2 -exec mv -t /var/www/html/ {} + > /dev/null 2>&1
  sudo rm -rf ${TEMP_PATH}
else
  echo "No website update"
fi