FROM debian:bullseye
LABEL maintainer='Diegmore'

RUN apt update && \
    apt upgrade &&\
    apt-get install -y php &&\
    apt-get install -y php-fpm &&\
    apt-get install -y mariadb-client &&\
    apt-get install -y php-mysql &&\
    apt-get install -y curl

RUN mkdir -p /run/php && chown www-data:www-data /run/php
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/.
COPY script.sh /
RUN chmod +x /script.sh

ENTRYPOINT ["sh", "./script.sh"]
