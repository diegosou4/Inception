# My Make file



BOLD = \033[1m
RESET = \033[0m
BLUE = \033[34m
RED = \033[31m

WHOIAM := $(shell whoami)
mariadb_volumes = /home/${WHOIAM}/data/mariadb
wordpress_volumes = /home/${WHOIAM}/data/wordpress
compose_docker = srcs/docker-compose.yml



build :
	@if [ ! -d ${mariadb_volumes} ]; then \
		mkdir -p ${mariadb_volumes};\
	fi
	@if [ ! -d ${wordpress_volumes} ]; then \
		mkdir -p ${wordpress_volumes};\
	fi
	@echo "$(BLUE)Building the containers$(NC)"
	@docker compose -f ${compose_docker} up --build

bashdb :
	echo "Entering mariadb bash"
	@docker container exec -it mariadb bash

bashnginx:
	echo "Entering ngnix bash"
	@docker container exec -it nginx bash

bashwp:
	echo "Entering wordpress bash"
	@docker container exec -it wordpress bash

bashredis:
	echo "Entering redis bash"
	@docker container exec -it redis bash

bashpostfix:
	echo "Entering postfix bash"
	@docker container exec -it postfix bash

bashftpserver:
	echo "Entering ftpserver bash"
	@docker container exec -it ftpserver bash

stopdb:
	echo "Stopping mariadb"
	@docker container stop mariadb

stopwp:
	echo "Stopping wordpress"
	@docker container stop wordpress

stopnginx:
	echo "Stopping nginx"
	@docker container stop nginx

stopredis:
	echo "Stopping redis"
	@docker container stop redis

stoppostfix:
	echo "Stopping postfix"
	@docker container stop postfix

stopnodejs:
	echo "Stopping nodejs"
	@docker container stop nodejs

rmdb:
	@docker container rm -f mariadb

rmwp:
	@docker container rm -f wordpress

rmnginx:
	@docker container rm -f nginx

rmredis:
	@docker container rm -f redis	

rmpostfix:
	@docker container rm -f postfix

rmnodejs:
	@docker container rm -f nodejs
	
rmftpserver:
	@docker container rm -f ftpserver



stopall: stopdb stopwp stopnginx stopredis stoppostfix stopnodejs

rmall: rmdb rmwp rmnginx rmredis rmpostfix rmnodejs rmftpserver