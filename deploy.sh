#!/bin/bash

echo "🚀 Desplegando desde GitHub..."

# Traer últimos cambios
git pull origin main

# Bajar contenedores
docker-compose down

# Construir
docker-compose build

# Levantar
docker-compose up -d

echo "✅ App corriendo en puerto 8088"