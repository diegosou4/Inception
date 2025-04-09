touch .env



echo password_ftp=$(cat $PASSFTP) >> .env
echo user_ftp=$user_ftp >> .env
echo personal_email=$personal_email >> .env
echo mail_postfix=$mail_postfix >> .env

PASSFTP=""

node /app/app/index.js