#!/bin/sh

echo "Starting to find public and local IP address"
pIp=$(wget -qO- http://ipecho.net/plain)
lIp=$(/sbin/ifconfig | awk -F':' '/inet addr/&&!/127.0.0.1/{split($2,_," ");print _[1]}')

#Enable this if above command is not able to find local IP address
#lIp2=$(/sbin/ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
echo "Public IP Address: " $pIp
echo "Local IP Address: " $lIp

echo "Sending an email to you with IP address information"
#sudo apt-get install sendemail
sendemail -f fromemail@gmail.com -t toemail@gmail.com -u "IP Address information" -m "Public IP: $pIp \n Local IP: $lIp" -s smtp.gmail.com -o tls=yes -xu gmail-user-name -xp gmail-password
