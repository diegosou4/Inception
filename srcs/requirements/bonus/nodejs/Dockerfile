FROM debian:bullseye
LABEL maintainer='Diegmore'

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install nodejs -y &&\
    apt-get install openssl -y &&\
    apt-get install -y sendemail libio-socket-ssl-perl libnet-ssleay-perl &&\
    apt-get install wget -y 



COPY ./conf /app

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/server.crt -keyout /etc/ssl/private/server.key -subj "/C=PT/ST=LS/L=Lisbon/O=42LIS/OU=diegmore/CN=diegmore"

RUN chmod 600 /etc/ssl/private/server.key && chmod 644 /etc/ssl/certs/server.crt
WORKDIR /app

ENV NODE_TLS_REJECT_UNAUTHORIZED=0


ENTRYPOINT ["sh", "script.sh"]


EXPOSE 443