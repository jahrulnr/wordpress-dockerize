build:
	docker build -t wordpress:dev . --no-cache

up: build
	docker compose up -d && docker compose logs -f

down:
	docker compose down --remove-orphans

save: build
	docker save wordpress:dev | gzip > wordpress.tar.gz
	zip -r data-wordpress.zip wordpress