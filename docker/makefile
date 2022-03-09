.DEFAULT_GOAL := up

up:
	docker-compose up

down:
	docker-compose down

clean:
	docker-compose down --rmi local -v

open:
	docker-compose exec app /bin/sh

migrate:
	docker-compose exec app npm run migrate-db

seed:
	docker-compose exec app npm run seed-db

run:
	docker run -it --env-file .env environmentagency/sroc-charging-module-api:latest /bin/sh