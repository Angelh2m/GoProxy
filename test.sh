#!/bin/bash


cat <<EOT >> goProcess.service
[Unit]
Description=Go Server

[Service]
ExecStart=/home/ubuntu/.proxy
WorkingDirectory=/home/ubuntu
User=root
Restart=always

[Install]
WantedBy=multi-user.target
EOT