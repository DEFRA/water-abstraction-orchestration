#!/bin/bash

cd "$(dirname "$0")" || exit

export $(grep -v '^#' ../secrets/.env.charge | xargs)
export $(grep -v '^#' ../secrets/.env.water | xargs)
export $(grep -v '^#' ../shared/variables.env | xargs)
export $(grep -v '^#' .env.docker | xargs)

docker-compose up -d
