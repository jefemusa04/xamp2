#!/bin/bash

echo "Desplegando "

# Detener contenedor si ya existe
docker-compose down

# Construir imagen
docker-compose build

# Levantar contenedor
docker-compose up -d

echo "Aplicación disponible en: http://localhost:8088"