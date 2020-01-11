#!/bin/bash

HOSTNAME=$(curl -s http://169.254.169.254/latest/meta-data/public-hostname)

IPADDR=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

echo "Instance Public Info:"
echo "Hostname: $HOSTNAME"
echo "IP Address: $IPADDR"