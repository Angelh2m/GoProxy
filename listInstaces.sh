#!/bin/bash

 aws ec2 describe-instances \
  --query "Reservations[*].Instances[*].{Instance:InstanceId, Subnet:SubnetId PublicIpAddress:PublicIpAddress}"  --region us-east-2 --output text