#!/bin/bash

cd "$(dirname "$0")" || exit


export $(grep -v '^#' ../secrets/.env.charge | xargs)
export $(grep -v '^#' ../secrets/.env | xargs)
export $(grep -v '^#' ../services/variables.env | xargs)

# Inject redis / wrls-db port and config to align
export COMPOSE_PROJECT_NAME="water-orchestration"

docker-compose pull
docker-compose up -d
