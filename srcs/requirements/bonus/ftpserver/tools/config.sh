#!/bin/sh
echo "Starting FTP server..."

cd /var/www/html

 if [ ! -f "/etc/vsftpd.userlist" ]; then
    PASS=$(cat "$PASSFTP")
    echo "Configuring FTP server"
    adduser  $USER_FTP --disabled-password 
    echo "$USER_FTP:$PASS" | /usr/sbin/chpasswd &> /dev/null
    echo "$USER_FTP" | tee -a /etc/vsftpd.userlist 
    chown -R "$USER_FTP:$USER_FTP" /var/www/html/ftp
    echo "user_sub_token=$USER_FTP" >> /tmp/vsftpd.conf
    echo "local_root=/var/bd-files/" >> /tmp/vsftpd.conf
    echo "chown_username=$USER_FTP" >> /tmp/vsftpd.conf
    mv /tmp/vsftpd.conf /etc/vsftpd.conf
    echo "FTP server setup complete"
    
    PASS=""
 fi
   while [ ! -d /var/bd-files ];
   do
     sleep 5
     echo "Waiting for FTP folder to be created..."
   done

PASSFTP=""

service vsftpd stop

/usr/sbin/vsftpd
