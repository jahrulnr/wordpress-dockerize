# WordPress Development Environment

This repository contains the necessary files to set up a WordPress development environment using Docker.

## Prerequisites

- Docker
- Docker Compose

## Setup

1. Clone the repository:
	```sh
	git clone https://github.com/jahrulnr/wordpress-dockerize.git
	```

2. Build the Docker image:
	```sh
	docker build -t wordpress:dev . --no-cache
	```

3. Start the containers:
	```sh
	docker compose up -d && docker compose logs -f
	```

4. To stop the containers:
	```sh
	docker compose down --remove-orphans
	```

## Saving the Docker Image

To save the Docker image and data:

1. Build the Docker image:
	```sh
	docker build -t wordpress:dev . --no-cache
	```

2. Save the Docker image and compress it:
	```sh
	docker save wordpress:dev | gzip > wordpress.tar.gz
	```

3. Zip the data:
	```sh
	zip -r data-wordpress.zip wordpress
	```

## License

This project is licensed under the terms of the GNU General Public License version 2 or later. See the [license.txt](wordpress/license.txt) file for details.

## Resources

- [WordPress Documentation](https://wordpress.org/documentation/)
- [WordPress Support Forums](https://wordpress.org/support/forums/)
- [WordPress Developer Resources](https://developer.wordpress.org/)
