#!/bin/sh
echo "Starting FTP server..."



 if [ ! -f "/etc/vsftpd.userlist" ]; then
    PASS=$(cat "$PASSFTP")
    echo "Configuring FTP server"
    adduser  $USER_FTP --disabled-password 
    mkdir /home/$USER_FTP
    echo "$USER_FTP:$PASS" | /usr/sbin/chpasswd &> /dev/null
    echo "$USER_FTP" | tee -a /etc/vsftpd.userlist 
    mkdir /home/$USER_FTP/ftp
    chown -R "$USER_FTP:$USER_FTP" /home/$USER_FTP/ftp
    echo "user_sub_token=$USER_FTP" >> /tmp/vsftpd.conf
    echo "local_root=/home/$USER_FTP/ftp" >> /tmp/vsftpd.conf
    echo "chown_username=$USER_FTP" >> /tmp/vsftpd.conf
    mv /tmp/vsftpd.conf /etc/vsftpd.conf
    echo "FTP server setup complete"
 fi


service vsftpd stop

/usr/sbin/vsftpd

tail -f /dev/null
