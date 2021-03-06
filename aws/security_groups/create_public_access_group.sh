#!/bin/bash

set -e

JQ_PATH="../../jq"

# Instance ID
IID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)


## Get VPC ##
macid=$(curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/)
VPC=$(curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/${macid}/vpc-id)

## GET existing security groups
SID=$(aws ec2 describe-instances --instance-ids $(curl -s http://169.254.169.254/latest/meta-data/instance-id) --query "Reservations[].Instances[].SecurityGroups[].GroupId[]" --output text | awk '{$1=$1;print}')

chmod -R +x  $JQ_PATH

# Create security Group
GID=$(aws ec2 create-security-group --group-name add-public-access --description "Open Port to the world" --vpc-id $VPC | $JQ_PATH/./jq-linux64 -r .GroupId)


# Attach secruty group
aws ec2 modify-instance-attribute --instance-id $IID --groups $GID $SID


aws ec2 authorize-security-group-ingress --group-id $GID --protocol icmp --port -1 --cidr 0.0.0.0/0

#ECHO OUTPUT:
echo "Status:"
echo "PING: Enabled"
echo "Instance ID: $IID"
echo "MAC ID: $macid"
echo "VPC ID: $VPC"
echo "New Security Group Name: add-public-access"
echo "New Security Group ID: $GID"


