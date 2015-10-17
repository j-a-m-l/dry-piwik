# docker-piwik-linode
This `docker-compose.yml` installs Piwik.


# Environments
The root `docker-compose.yml` is the base of the environment specific configurations, so it does not links containers, nor creates the volumes.

## Development
Exposes ports 980 and 9443, so it should not conflict with your local servers.
`docker-compose -f ./environments/development/docker-compose.yml up -d`

### .env
This file defines the `MariaDB` credentials.

## Production
Exposes ports 80 and 443.
`docker-compose -f ./environments/production/docker-compose.yml up -d`

### .env
This file defines the `MariaDB` credentials.


# Data
Includes the Piwik generated configuration and the MariaDB data.


# Configuration

The main `Dockerfile` installs Piwik, although the final steps should be performed manually yet.

## Installation configuration

### Database Setup
Use `db` as the "Database Server".

## Piwik
The `piwik` folder includes the entrypoint of the `app` and the configuration of the `cron` containers.

## PHP
The `php` folder includes several PHP configuration files that are used during the Piwik installation.

could be used for Linode
php-fpm?
/usr/local/etc/php-fpm.conf.default
/usr/local/etc/php-fpm.conf
/usr/local/etc/php/conf.d/

## Nginx
The `nginx` folder includes the Nginx configuration that is used in the `server` container.
/etc/ngix/conf.d/linode.cnf

## MariaDB
The `mariadb` folder includes the MariaDB configuration that is used in the `server` container.
/etc/mysql/conf.d/linode.cnf


# Authors
Juan A. Martín Lucas (https://github.com/j-a-m-l).


# License
This project is licensed under the MIT license. See [LICENSE](LICENSE) for details.
