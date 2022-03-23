#!/bin/bash

cd "$(dirname "$0")" || exit
export COMPOSE_PROJECT_NAME="water-orchestration"
docker-compose down