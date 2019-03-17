#!/bin/bash

# Effortlesly create CentOS vm's using kickstart and virt-install

unset name
unset octet

domain="vms.priv"
host="192.168.122.1"
template_kickstart="/var/www/html/install/ks.cfg"

name=$1
octet=$2

if [[ -z "$name" ]]
then
	name="vm$RANDOM"
fi

if [[ -z "$octet" ]]
then
	octet="99"
fi

echo $name
rm /var/www/html/install/ks_tmp.cfg
cat /var/www/html/install/ks.cfg | sed s/HOSTNAME/$name.$domain.priv/g /var/www/html/install/ks.cfg | sed s/IPADDRESS/$octet/g > /var/www/html/install/ks_tmp.cfg
virt-install \
  --name $name\
  --memory 4096 \
  --vcpus 2 \
  --disk size=20 \
  --location http://192.168.122.1/install \
  --os-variant rhel7 \
  --extra-args "ks=http://192.168.122.1/install/ks_tmp.cfg" &

echo "192.168.122.$octet $name.$domain.priv $name" >> /etc/hosts
