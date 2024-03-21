NAME = inception
DOCKER_COMPOSE_PATH := ./srcs/docker-compose.yml
VOLUME_PATH := /Users/jiseong/data

all: $(NAME)
$(NAME): up

up:
	sudo mkdir -p $(VOLUME_PATH)/mariadb_data/
	sudo mkdir -p $(VOLUME_PATH)/wordpress_data/
	docker-compose -f $(DOCKER_COMPOSE_PATH) up --build -d

down:
	docker-compose -f $(DOCKER_COMPOSE_PATH) down

clean:
	docker-compose -f $(DOCKER_COMPOSE_PATH) down -v 

fclean: clean
	docker system prune -f
	sudo rm -rf $(VOLUME_PATH)

re:
	make fclean
	make all

.PHONY : all up down clean fclean re