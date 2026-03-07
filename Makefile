build:
	docker build -t wordpress:1.1 . -f docker/Dockerfile

up: build
	docker compose -f docker/compose.yml up -d
	docker compose -f docker/compose.yml logs -f

down:
	docker compose -f docker/compose.yml down --remove-orphans

shell:
	docker exec -itu 100:101 wordpress bash

save: build
	docker save wordpress:1.1 | gzip > wordpress.tar.gz