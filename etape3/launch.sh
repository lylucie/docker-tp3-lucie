#!/bin/bash

# Lancer tous les services en arrière-plan
docker compose up -d

echo "🚀 Lancement terminé !"

echo "voici quelque commandes à savoir"

# Stoppe et supprime les conteneurs existants (sécurité)
echo "docker compose down"

# Afficher l'état des conteneurs
echo "docker compose ps"

echo "Visitez http://localhost:8080/ pour index.php"
echo "Visitez http://localhost:8080/test.php pour test.php"
