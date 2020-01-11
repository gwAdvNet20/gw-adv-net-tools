#!/bin/bash

set -e 

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 security-group-id portNumber "
    exit
fi

SID=$1
PORT=$2

aws ec2 revoke-security-group-ingress --group-id  $SID --protocol tcp --port $PORT --cidr 0.0.0.0/0

aws ec2 revoke-security-group-egress --group-id  $SID --protocol tcp --port $PORT --cidr 0.0.0.0/0