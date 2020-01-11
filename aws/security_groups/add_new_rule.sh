#!/bin/bash

set -e

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 security-group-id portNumber"
    exit
fi

SID=$1
PORT=$2

## Adding inbound
aws ec2 authorize-security-group-ingress \
    --group-id $SID \
    --protocol tcp \
    --port $PORT \
    --cidr 0.0.0.0/0


##Adding outbound
aws ec2 authorize-security-group-egress \
    --group-id $SID \
    --protocol tcp \
    --port $PORT \
    --cidr 0.0.0.0/0


echo "Successfully added PORT $PORT"