name = inception

build:
	@printf "Build configuration ${name}...\n"
	@docker-compose -f srcs/docker-compose.yml up -d --build

re:
	@printf "Rebuild configuration ${name}...\n"
	@docker-compose -f srcs/docker-compose.yml up -d --build

down:
	@printf "Stop configuration ${name}...\n"
	@docker-compose -f srcs/docker-compose.yml down

clean: down
	@printf "Purge configuration ${name}...\n"
	@docker system prune -a
fclean:
	@printf "Full cleanup of all docker configurations\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker volume rm $$(docker volume ls -q)
	@docker network prune --force
	@docker volume prune --force

.PHONY	: all build down re clean fclean

