#!/bin/bash

# ─────────────────────────────────────────────────────
#  Uso:
#    ./deploy.sh        →  PRODUCCIÓN  (puerto 80)
#    ./deploy.sh dev    →  DESARROLLO  (puerto 8088)
# ─────────────────────────────────────────────────────

ENTORNO=${1:-prod}

if [ "$ENTORNO" = "dev" ]; then
  COMPOSE_FILE="docker-compose.yml"
  PUERTO=8088
else
  COMPOSE_FILE="docker-compose.produccion.yml"
  PUERTO=80
fi

echo "🚀 Desplegando entorno: $ENTORNO usando $COMPOSE_FILE..."

git pull origin master || { echo "❌ Error en git pull"; exit 1; }

docker-compose -f $COMPOSE_FILE down   || { echo "❌ Error en down";  exit 1; }
docker-compose -f $COMPOSE_FILE build  || { echo "❌ Error en build"; exit 1; }
docker-compose -f $COMPOSE_FILE up -d  || { echo "❌ Error en up";    exit 1; }

echo "✅ App corriendo en http://$(hostname -I | awk '{print $1}'):$PUERTO"