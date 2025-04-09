FROM debian:bullseye
LABEL maintainer='Diegmore'

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install nodejs npm -y




CMD ["node", "/var/www/html/profile/index.js"]

EXPOSE 4000