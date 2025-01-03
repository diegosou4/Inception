FROM debian:bullseye
LABEL maintainer='Diegmore'


RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y vsftpd 



#COPY ./conf/vsftpd.conf /etc/vsftpd.conf

CMD [ "tail", "-f", "/dev/null"]