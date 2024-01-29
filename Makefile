NAME = inception
SRCS = ./srcs/
COMPOSE = ./srcs/docker-compose.yml

all: conf up

conf: #dont forget the env
	@echo "Creating volumes...\n"
	@mkdir -p /home/rafaelsoares/data/mariadb_vol /home/rafaelsoares/data/wordpress_vol
	@echo "\n"
	@echo "Starting docker compose up..."

up:
	docker compose -p $(NAME) -f $(COMPOSE) up --build -d

down:
	docker compose -p $(NAME) down --volumes

start:
	docker compose -p $(NAME) start

stop:
	docker compose -p $(NAME) stop

clean-images:
	docker rmi -f $$(docker images -q) || true

clean: down clean-images

fclean: clean
	@sudo rm -rf /home/rafaelsoares/data
	@docker system prune

re: fclean conf up