#! /bin/bash

# Install Postfix
if [ ! -f "/etc/postfix/sasl_passwd.db" ]; then
    MAIL_PASS=$(cat "$POSTMAIL")
    echo "Configuring Postfix"
    postconf compatibility_level=2 
    postconf inet_protocols=ipv4
    postmap /etc/postfix/main.cf 
    echo "[smtp.gmail.com]:587 $MAIL_POSTFIX:$MAIL_PASS" > /etc/postfix/sasl_passwd
    chmod 600 /etc/postfix/sasl_passwd
    postmap /etc/postfix/sasl_passwd
    echo "Postfix configured"
    
    service postfix stop
    echo "Updating /etc/hosts"
    echo "127.0.0.1 $DOMAIN_NAME" >> etc/hosts
    echo "Updated /etc/hosts"
    MAIL_PASS=""
fi
echo "Starting Postfix"


postfix start-fg
echo "Postfix started"




