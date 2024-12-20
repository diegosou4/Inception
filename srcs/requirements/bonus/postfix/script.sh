

# Install Postfix
if [ ! -f "/etc/postfix/sasl_passwd.db" ]; then
    echo "Configuring Postfix"
    postconf compatibility_level=2 
    postmap /etc/postfix/main.cf 
    postmap /etc/postfix/sasl_passwd
    echo "Postfix configured"
    service postfix stop
fi

# service postfix restart 
echo "Starting Postfix"
postfix start-fg

echo 'E-mail enviado com sucesso' | mutt -s 'Pneu furouuuu cenda o farol' diegoaguia31@gmail.com
