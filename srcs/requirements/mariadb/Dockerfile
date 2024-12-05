FROM debian:bullseye
LABEL maintainer='Diegmore'

RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get install mariadb-server -y &&\
    apt-get mysql_secure_installation &&\
    apt-get install mariadb-server -y

    