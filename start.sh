#!/bin/bash

apt list --upgradable
sudo apt-get update -y

echo "Yum update"

sudo curl https://raw.githubusercontent.com/Angelh2m/GoProxy/master/proxy --output ~/.proxy
sudo chmod 777 ~/.proxy

echo "CURL proxy done"

touch /etc/systemd/system/goProcess.service
sudo chmod 777 /etc/systemd/system/goProcess.service
sudo curl https://raw.githubusercontent.com/Angelh2m/GoProxy/master/goProcess.service --output /etc/systemd/system/goProcess.service

echo "CURL systemd process done"

# <!-- systemctl settings -->
sudo systemctl stop goProcess.service

# <!-- Add the service -->
sudo systemctl enable goProcess.service

# <!-- Start Service -->
sudo systemctl start goProcess.service

# <!-- Check if systemd started it. -->
sudo systemctl status goProcess.service


# <!-- https://gist.github.com/amazingandyyy/60edaede96fef0bc5524c01cb5a7f92b -->