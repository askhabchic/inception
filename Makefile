DCMP = ./srcs/docker-compose.yml
DCMP_BONUS = ./srcs/docker-compose-bonus.yml
DCOMPOSE = docker-compose -f ${DCMP} -p my
DCOMPOSE_BONUS = docker-compose -f ${DCMP_BONUS} -p my

PATH_DB = /home/fhyman/data/db 
PATH_WP = /home/fhyman/data/wp
RM = sudo rm -rf

all: up
clean: 
	${DCOMPOSE} down
fclean: down
	docker rmi -f $$(docker images -qa)
	docker volume rm $$(docker volume ls -q)
	docker system prune -a --force 
# --force [= false] Не запрашивать подтверждение
up:
	mkdir -p ${PATH_DB}
	mkdir -p ${PATH_WP}
	${DCOMPOSE} up -d --build
re: down up
build: 
	${DCOMPOSE} build
stop:
	docker stop $$(docker ps -a -q)
delete: stop
	docker rmi $$(docker images)
down: cleanvol
	${DCOMPOSE} down
cleanvol:
	${RM} ${PATH_DB} 
	${RM} ${PATH_WP}
bonus:
	${DCOMPOSE_BONUS} up -d --build

	

.PHONY: all clean fclean up re build down stop delete cleanvol bonus
# Остановить все контейнеры сразу : docker container stop $(docker container ls -aq)
# Удалить все остановленные контейнеры: docker container prune --force
# Удалить все неиспользуемые изображения: docker image prune --all --force
