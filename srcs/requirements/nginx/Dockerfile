FROM debian:bullseye
LABEL maintainer='Diegmore'

RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get install nginx -y &&\
    apt-get install openssl -y 
    
COPY default etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]



EXPOSE 80