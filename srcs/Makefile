# My Make file





build :
	@docker compose up --build
bashdb :
	echo "Entrando no bash da mariadb"
	@docker container exec -it mariadebezinha bash
bashnginx:
	echo "Entrando no bash do nginx"
	@docker container exec -it nginx bash
bashwp:
	echo "Entrando no bash do wordpress"
	@docker container exec -it wordpress bash
stopdb:
	docker container stop mariadebezinha
rmdb:
	docker container rm -f mariadebezinha
rmwp:
	docker container rm -f wordpress
rmnginx:
	docker container rm -f nginx
rmall: rmdb rmwp rmnginx