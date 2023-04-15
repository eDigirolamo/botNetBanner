#!/bin/bash

#create new chain
/usr/sbin/iptables -N AMAZON
/usr/sbin/iptables -I INPUT 1 -j AMAZON

#whatever directory you want here
cd /

#delete the list/ip obj chalk full of server ip's before we rebuild it && pull the latest and greatest ranges
rm ip-ranges.json
rm awsips.txt

#create the empty list
touch awsips.txt

# GET THE DATA FROM AMAZON
wget https://ip-ranges.amazonaws.com/ip-ranges.json

#Filter based on EC2 Service and append to list.
jq -r '.prefixes[] | select(.service=="EC2") | .ip_prefix' < ip-ranges.json >> awsips.txt


#Flush the specific chain
/usr/sbin/iptables -F AMAZON

# Youd be suprized what services run on amazon so if you dont do your due diligence you 
# can potentially prevent your third party api's/services access. For example below we allow solve360 acces because
# not all EC2 instances are bad. since we dont know the ip and its can change we --source the domain here.  
# /usr/sbin/iptables -A AMAZON -s secure.solve360.com -j ACCEPT

#loop over the entire list of active EC2 instances and ban every single one from accessing your server
for x in $(cat awsips.txt)
do
    /usr/sbin/iptables -A AMAZON -s $x -j DROP

done
# and lastly SAVE
/usr/sbin/iptables-save > /etc/sysconfig/iptables

