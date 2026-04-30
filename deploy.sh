#!/bin/bash

echo "🚀 Desplegando desde GitHub..."

# Traer cambios
git pull origin master || { echo "❌ Error en git pull"; exit 1; }

# Docker
docker-compose down || { echo "❌ Error en down"; exit 1; }
docker-compose build || { echo "❌ Error en build"; exit 1; }
docker-compose up -d || { echo "❌ Error en up"; exit 1; }

echo "✅ App corriendo en puerto 8088"