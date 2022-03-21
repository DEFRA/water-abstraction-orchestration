#!/bin/bash

cd "$(dirname "$0")" || exit

# Inject redis / wrls-db port and config to align

docker-compose up -d

#docker rm -f wrls-db redis
#
#echo "Starting Redis"
#docker run --name redis -p 6379:6379 -d redis
#
#echo "Starting WRLS Database"
#docker run --name wrls-db \
#  -e POSTGRES_USER=water_user \
#  -e POSTGRES_PASSWORD=password \
#  -e POSTGRES_DB=permits \
#  -v wrls_db_volume:/var/lib/postgresql/data \
#  -p 5432:5432 \
#  -d \
#  postgres

#sleep 30
