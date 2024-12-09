FROM debian:bullseye
LABEL maintainer='Diegmore'

RUN apt update && \
    apt upgrade &&\
    apt-get install -y php &&\
    apt-get install -y php-fpm
    


CMD ["tail", "-f", "/dev/null"]
