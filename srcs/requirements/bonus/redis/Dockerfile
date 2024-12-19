FROM debian:bullseye
LABEL maintainer='Diegmore'


RUN apt-get update && \
    apt-get upgrade -y &&\
    apt-get install -y redis-server

COPY ./conf/redis.conf /etc/redis/redis.conf
CMD [ "redis-server", "--port 6379","--appendonly yes","--protected-mode no"]
EXPOSE 6379