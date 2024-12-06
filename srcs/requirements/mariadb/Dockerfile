FROM debian:bullseye
LABEL maintainer='Diegmore'

RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sql /etc/mysql/init.sql

RUN mkdir /run/mysqld/

RUN --mount=type=secret,id=db_password,required --mount=type=secret,id=db_root_password,required \

 
CMD ["mysqld_safe"]

EXPOSE 3307