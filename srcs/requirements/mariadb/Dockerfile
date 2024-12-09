FROM debian:bullseye
LABEL maintainer='Diegmore'

RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get install -y mariadb-server 

RUN mkdir app && mkdir -p /run/mysqld && \
    touch /run/mysqld/mysqld.sock


COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY ./conf/my.cnf /etc/.
COPY setenv.sh /
RUN chmod +x /setenv.sh
ENTRYPOINT ["sh" ,"./setenv.sh"]
CMD ["mysqld_safe"]

EXPOSE 3306