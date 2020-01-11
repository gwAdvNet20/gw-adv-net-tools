#!/bin/bash


if [ "$#" -ne 1 ]; then
    echo "Usage: $0 security-group-name"
    exit
fi

aws ec2 describe-security-groups --group-names $1
