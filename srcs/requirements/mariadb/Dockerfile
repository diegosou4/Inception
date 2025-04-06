FROM debian:bullseye
LABEL maintainer='Diegmore'

RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get install -y mariadb-server && \
    apt-get install -y mariadb-client && \
    apt-get install -y iputils-ping 



COPY ./conf/50-server.cnf /var/lib/mysql/mariadb.conf.d/.
COPY ./conf/my.cnf /var/lib/mysql/.
COPY setenv.sh /var/lib/mysql/.

RUN chmod +x /var/lib/mysql/setenv.sh
ENTRYPOINT ["sh" ,"var/lib/mysql/setenv.sh"]
CMD ["mysqld_safe"]

EXPOSE 3306