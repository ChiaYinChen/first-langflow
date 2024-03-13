.PHONY: tests

up:
	docker-compose up -d
down:
	docker-compose down --rmi local
build:
	docker-compose build --no-cache
