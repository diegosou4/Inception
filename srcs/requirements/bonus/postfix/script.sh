#! /bin/bash

# Install Postfix
if [ ! -f "/etc/postfix/sasl_passwd.db" ]; then
    echo "Configuring Postfix"
    postconf compatibility_level=2 
    postconf inet_protocols=ipv4
    postmap /etc/postfix/main.cf 
    chmod 600 /etc/postfix/sasl_passwd
    postmap /etc/postfix/sasl_passwd
    echo "Postfix configured"
    
    service postfix stop
    echo "Updating /etc/hosts"
    echo "127.0.0.1 $DOMAIN_NAME" >> etc/hosts
    echo "Updated /etc/hosts"
    
fi
echo "Starting Postfix"


postfix start-fg
echo "Postfix started"




