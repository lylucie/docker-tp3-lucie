#!/bin/bash

# Créer le réseau
docker network create tp2-network 2>/dev/null

# Lancer MariaDB avec initdb
docker run -d --name data --network tp2-network \
  -e MARIADB_ROOT_PASSWORD=my-secret-pw \
  -e MARIADB_DATABASE=testdb \
  -v $(pwd)/initdb:/docker-entrypoint-initdb.d \
  mariadb:latest

# Construire l'image PHP avec mysqli
docker build -t php-mysqli .

# Lancer PHP-FPM
docker run -d --name script --network tp2-network -v $(pwd)/src:/app php-mysqli

# Lancer Nginx
docker run -d --name http --network tp2-network -p 8080:8080 \
  -v $(pwd)/src:/app \
  -v $(pwd)/config/default.conf:/etc/nginx/conf.d/default.conf:ro \
  nginx:alpine
