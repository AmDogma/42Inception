all:
	docker-compose -f srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f srcs/docker-compose.yml down
	docker image prune -a

vclean:
	docker volume rm $(docker volume ls -q)
	rm -rf /home/emil/data/wordpress_data/* /home/emil/data/mariadb_data/*