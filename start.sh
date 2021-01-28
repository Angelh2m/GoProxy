#!/bin/bash

apt list --upgradable
sudo apt-get update -y

sudo curl https://raw.githubusercontent.com/Angelh2m/GoProxy/master/proxy --output ~/.proxy
sudo chmod 777 ~/.proxy

touch /etc/systemd/system/goProcess.service
sudo chmod 777 /etc/systemd/system/goProcess.service
sudo curl https://raw.githubusercontent.com/Angelh2m/GoProxy/master/goProcess.service --output /etc/systemd/system/goProcess.service


# <!-- systemctl settings -->
sudo systemctl stop goProcess.service

# <!-- Add the service -->
sudo systemctl enable goProcess.service

# <!-- Start Service -->
sudo systemctl start goProcess.service

# <!-- Check if systemd started it. -->
sudo systemctl status goProcess.service


# <!-- https://gist.github.com/amazingandyyy/60edaede96fef0bc5524c01cb5a7f92b -->