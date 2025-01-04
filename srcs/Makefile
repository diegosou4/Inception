# My Make file



build :
	echo "Building the containers"
	@docker compose up --build

bashdb :
	echo "Entering mariadb bash"
	@docker container exec -it mariadebezinha bash

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
	@docker container stop mariadebezinha

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
	@docker container rm -f mariadebezinha

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