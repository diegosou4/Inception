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
stopall: stopdb stopwp stopnginx stopredis stoppostfix
rmall: rmdb rmwp rmnginx rmredis rmpostfix