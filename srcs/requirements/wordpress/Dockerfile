FROM debian:bullseye
LABEL maintainer='Diegmore'

RUN apt update -y && \
    apt upgrade -y &&\
    apt-get install -y php &&\
    apt-get install -y php-fpm &&\
    apt-get install -y mariadb-client &&\
    apt-get install -y php-mysql &&\
    apt-get install -y curl &&\
    apt-get install -y wget &&\
    apt-get install -y sendemail libio-socket-ssl-perl libnet-ssleay-perl &&\ 
    apt-get install -y iputils-ping 

RUN mkdir -p /run/php && chown www-data:www-data /run/php
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/.

COPY ./conf/profile /var/www/html/profile/.
COPY script.sh /
RUN chmod +x /script.sh
RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT ["sh", "./script.sh"]
