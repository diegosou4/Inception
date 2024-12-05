FROM debian:bullseye
LABEL maintainer='Diegmore'

RUN apt update && \
    apt upgrade &&\
    apt-get install -y php7.4-fpm 

COPY "./script.sh" "/"

RUN chmod 777 ./script.sh
CMD ["bash", "script.sh"]
