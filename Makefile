up :
	sudo mkdir -p /home/aammirat/data/wordpress /home/aammirat/data/mariadb
	sudo chmod 777 /home/aammirat/data/wordpress /home/aammirat/data/mariadb	
	docker-compose -f srcs/docker-compose.yml up --detach
	
clean :
	docker-compose -f srcs/docker-compose.yml down -v
	
down : 	
	docker-compose -f srcs/docker-compose.yml down -v

fclean : clean	
	sudo rm -rf $(HOME)/data
	docker system prune -a
	docker volume prune -f
stop : 
	docker-compose -f srcs/docker-compose.yml stop

start : 
	docker-compose -f srcs/docker-compose.yml start

re : fclean up


.PHONY: clean fclean re stop start up down
