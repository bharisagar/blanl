#!/bin/bash

# Thi script is to check the details of server,hostname,ipaddress and os details.

echo " My server details "
uname -a
echo " Host details "
hostnamectl
echo " IP address of my system "
ifconfig
echo " OS details of my server "
cat /etc/os-release
