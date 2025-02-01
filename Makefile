build:
	docker build -t wordpress:dev . -f docker/Dockerfile
build-prod:
	docker build -t wordpress:dev . -f docker/Dockerfile --build-arg "DOCKER_ENV=production"

up: build
	docker compose -f docker/compose.yml up -d
	docker compose -f docker/compose.yml logs -f

down:
	docker compose -f docker/compose.yml down --remove-orphans

shell:
	docker exec -itu 1000:1000 wordpress bash

save: build-prod
	docker save wordpress:dev | gzip > wordpress.tar.gz
	zip -r data-wordpress.zip wordpress