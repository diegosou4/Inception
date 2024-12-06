FROM debian:bullseye
LABEL maintainer='Diegmore'

RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get install nginx -y &&\
    apt-get install openssl -y 
    


CMD ["nginx", "-g", "daemon off;"]



EXPOSE 80