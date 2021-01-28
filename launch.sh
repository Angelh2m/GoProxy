#!/bin/bash


export AWS_PAGER=""

echo "Launch instances ..."
# go run launchEC2.go
echo "List instances ..."
sh listInstaces.sh

# 
# go run sshdial/sshdial.go <IP_ADDRESS>


# DEBUG
 
