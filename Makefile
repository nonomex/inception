all :
	sudo mkdir -p /home/aammirat/data/wordpress /home/aammirat/data/mariadb
	sudo chmod 777 /home/aammirat/data/wordpress /home/aammirat/data/mariadb	
	docker-compose -f srcs/docker-compose.yml up
	
up : 
	docker-compose -f srcs/docker-compose.yml up

down :
	docker-compose -f srcs/docker-compose.yml down
	docker system prune -f -a --volumes
	sudo rm -rf $(HOME)/data

stop : 
	docker-compose -f srcs/docker-compose.yml stop


start : 
	docker-compose -f srcs/docker-compose.yml start
