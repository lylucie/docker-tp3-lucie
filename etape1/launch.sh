#!/bin/bash

echo "Étape 1 : environnement prêt"

# Créer le réseau dédié
docker network create tp1-network 2>/dev/null

# Lancer le conteneur PHP-FPM
docker run -d --name script --network tp1-network -v $(pwd)/src:/app php:8.2-fpm

# Lancer le conteneur Nginx
docker run -d --name http --network tp1-network -p 8080:8080 \
  -v $(pwd)/src:/app \
  -v $(pwd)/config/default.conf:/etc/nginx/conf.d/default.conf:ro \
  nginx:alpine
