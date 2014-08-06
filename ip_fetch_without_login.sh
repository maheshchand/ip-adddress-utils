#!/bin/sh

pIp=$(wget -qO- http://ipecho.net/plain)
lIp=$(ifconfig | awk -F':' '/inet addr/&&!/127.0.0.1/{split($2,_," ");print _[1]}')

echo $pIp
echo $lIp

#sudo apt-get install sendemail
sendemail -f fromemail@gmail.com -t toemail@gmail.com -u "IP Address information" -m "Public IP: $pIp \n Local IP: $lIp" -s smtp.gmail.com -o tls=yes -xu username -xp password
