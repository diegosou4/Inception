FROM debian:bullseye
LABEL maintainer='Diegmore'

RUN echo "postfix postfix/mailname string diegmore.42.fr" | debconf-set-selections && \
    echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

RUN apt-get update && \
    apt-get upgrade -y && \
    apt install postfix mailutils ca-certificates mutt -y &&\
    apt-get install -y nano

COPY ./conf/main.cf /etc/postfix/main.cf
COPY ./conf/sasl_passwd /etc/postfix/sasl_passwd
COPY script.sh /
RUN chmod +x /script.sh

ENTRYPOINT [ "sh", "./script.sh" ]
RUN service postfix start


EXPOSE 25