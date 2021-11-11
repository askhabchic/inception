# inception

This project aims to broaden knowledge of system administration by using Docker.
Here we're virtualize several Docker images, creating them in new personal virtual machine.

We have to set up:

• A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.

• A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.

• A Docker container that contains MariaDB only without nginx.

• A volume that contains WordPress database.

• A second volume that contains WordPress website files.

• A docker-network that establishes the connection between containers. Containers have to restart in case of a crash.

Bonus list:

• Set up redis cache for WordPress website in order to properly manage the
cache.

• Create a simple static website in the language except PHP (Yes, PHP
is excluded!).

• Set up Adminer.
