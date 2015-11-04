# dry-piwik
This projects includes a `Dockerfile` that installs Piwik ([jaml/dry-piwik](https://hub.docker.com/r/jaml/dry-piwik/)) and several `docker-compose.yml` that use that image, along MariaDB and Nginx for installing the full 

Current version is `0.5.1`.

## Usage
1. Git-clone this repository (`git clone https://github.com/j-a-m-l/dry-piwik`)
2. Copy the example environments (`cp dry-piwik/docker-compose.*.yml <your-folder>`)
3. Replace the right path in those `docker-compose.yml` files
`
<service_name>:
  extends:
   file: <your-dry-piwik-clone-path>/docker-compose.base.yml
   service: <service_name>
`

## Environments
The root `docker-compose.base.yml` is the base of the environment specific configurations, so it does not links containers, nor creates the volumes.

* All the environments have a `.env` file that defines the `MariaDB` credentials.

### Development
Exposes ports 980 and 9443, so it should not conflict with your local servers.
Volumes in `data`
It creates a data folder that is to several volumes
`
docker-compose -p piwik-development -f ocker-compose.development.yml up -d
`

### Production
Exposes ports 80 and 443.
`
docker-compose -p piwik-production -f docker-compose.production.yml up -d
`

## Piwik installation wizard
`db` container is aliased as `database`, so in the "Database Setup" step, you can use `database` as "server host"


## Data
Includes the Piwik generated configuration and the MariaDB data.


## Configuration

The main `Dockerfile` installs Piwik, although the final steps should be performed manually yet.

### Installation configuration

#### Database Setup
Use `db` as the "Database Server".

### Piwik
The `config/piwik` folder includes the entrypoint of the `web` and the configuration of the `cron` containers.

* Until having the official Piwik image in Docker Hub, this project is using ([jaml/tmp-official-piwik](https://hub.docker.com/r/jaml/tmp-official-piwik/)).

### PHP
The `config/php` folder includes several PHP configuration files that are used during the Piwik installation.

### Nginx
The `config/nginx` folder includes the base Nginx configuration that is used in the `server` container.

### MariaDB
The `config/mariadb` folder includes the base MariaDB configuration that is used in the `server` container.


## Development
`docker build -t jaml/dry-piwik`

`docker-compose -p piwik-development -f .docker-compose.development.yml up`


## Authors
Juan A. Martín Lucas (https://github.com/j-a-m-l).


## License
This project is licensed under the MIT license. See [LICENSE](LICENSE) for details.
