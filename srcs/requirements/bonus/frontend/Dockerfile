FROM debian:bullseye
LABEL maintainer='Diegmore'


RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nodejs 

COPY ./Profile ./app/

WORKDIR /app

CMD ["node", "index.js"]


EXPOSE 3000