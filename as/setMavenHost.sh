#!/bin/sh
if [ -z $1];then
  echo "*************************"
  echo "Please input the command with hostip's third part"
  echo "*************************"
  exit;
fi

if [ -z $2];then
  echo "*************************"
  echo "Please input the command with hostip's last part"
  echo "*************************"
  exit;
fi

currentIP=`ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"`
echo "*************************"
echo "current ip:${currentIP}"
echo "*************************"
hostIP="10.68.${1}.${2}"
echo "hostip ip:${hostIP}"
echo "*************************"

echo "-----------------------------"
cat /etc/hosts
echo "-----------------------------"
src="10\.[0-9]*\.[0-9]*\.[0-9]*\ maven.bihe0832.com"
dst="${hostIP} maven.bihe0832.com"
cat /etc/hosts | sed "s/$src/$dst/g" > ~/zixie/temp/hosts
echo "-----------------------------"
cat ~/zixie/temp/hosts
echo "-----------------------------"
sudo mv -f ~/zixie/temp/hosts /etc/hosts

open "http://${hostIP}:8081/nexus/"
