# dry-docker-piwik
This `docker-compose.yml` installs Piwik.


# Environments
The root `docker-compose.yml` is the base of the environment specific configurations, so it does not links containers, nor creates the volumes.

* All the environments have a `.env` file that defines the `MariaDB` credentials.

## Development
Exposes ports 980 and 9443, so it should not conflict with your local servers.
`
docker-compose -p piwik-development -f ./environments/development/docker-compose.yml up -d
`
Or
`
COMPOSE_FILE=./environments/development/docker-compose.yml
docker-compose -p piwik-development up -d
`

## Production
Exposes ports 80 and 443.
`
docker-compose -p piwik-production -f ./environments/production/docker-compose.yml up -d
`


# Data
Includes the Piwik generated configuration and the MariaDB data.


# Configuration

The main `Dockerfile` installs Piwik, although the final steps should be performed manually yet.

## Installation configuration

### Database Setup
Use `db` as the "Database Server".

## Piwik
The `config/piwik` folder includes the entrypoint of the `web` and the configuration of the `cron` containers.

## PHP
The `config/php` folder includes several PHP configuration files that are used during the Piwik installation.

## Nginx
The `config/nginx` folder includes the base Nginx configuration that is used in the `server` container.

## MariaDB
The `config/mariadb` folder includes the base MariaDB configuration that is used in the `server` container.


# Authors
Juan A. Martín Lucas (https://github.com/j-a-m-l).


# License
This project is licensed under the MIT license. See [LICENSE](LICENSE) for details.
