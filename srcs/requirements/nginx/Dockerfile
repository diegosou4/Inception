FROM debian:bullseye
LABEL maintainer='Diegmore'

RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get install nginx -y &&\
    apt-get install openssl -y 
    
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/inception.crt -keyout /etc/ssl/private/inception.key -subj "/C=PT/ST=LS/L=Lisbon/O=42LIS/OU=diegmore/CN=diegmore"
RUN chmod 600 /etc/ssl/private/inception.key && chmod 644 /etc/ssl/certs/inception.crt

COPY ./conf/default /etc/nginx/sites-available/default
 

CMD ["nginx", "-g", "daemon off;"]



EXPOSE 443