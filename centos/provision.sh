#!/usr/bin/env bash

TARGET="https://www.tooplate.com/zip-templates/2107_new_spot.zip"
BASENAME=$(basename ${TARGET} .zip)
INDEX_PATH=/var/www/html/
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
  sudo wget ${TARGET}
  sudo unzip -d ${TEMP_PATH} -o ${BASENAME}.zip
  sudo rm -rf ${INDEX_PATH}/* && sudo cp -rL ${TEMP_PATH}/${BASENAME}/* ${INDEX_PATH}
  systemctl restart httpd
  sudo rm -rf ${TEMP_PATH} ${BASENAME}.zip

else
  echo "No website update"
fi