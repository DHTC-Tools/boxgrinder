#!/bin/bash
## Generate our condor attributes
echo "## Attributes picked up at boot time
TCP_FORWARDING_HOST=$(curl -s http://instance-data.ec2.internal/latest/meta-data/public-ipv4)
PRIVATE_NETWORK_NAME=$(curl -s http://instance-data.ec2.internal/latest/meta-data/placement/availability-zone)
PRIVATE_NETWORK_INTERFACE=$(curl -s  curl http://169.254.169.254/latest/meta-data/local-ipv4)
" > /etc/condor/config.d/99-boot.conf
## Set our hostname
hostname $(curl http://instance-data.ec2.internal/latest/meta-data/public-hostname)
## Restart condor
service condor restart
