FROM debian:bullseye
LABEL maintainer='Diegmore'


RUN apt-get update && \
    apt-get upgrade -y  && \
    apt-get install vsftpd -y && \
    apt-get install passwd -y


COPY ./tools/config.sh  /.
COPY ./conf/vsftpd.conf /tmp/.

RUN chmod +x /config.sh
ENTRYPOINT [ "sh" , "./config.sh" ]

EXPOSE 21