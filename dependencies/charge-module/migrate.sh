#!/bin/bash

cd "$(dirname "$0")" || exit

export $(grep -v '^#' ../../secrets/.env.charge | xargs)
export $(grep -v '^#' ../../secrets/.env | xargs)
export $(grep -v '^#' ../../services/variables.env | xargs)

echo "Migrating Charge module"
docker exec charge-module-api sh -c "npm run migrate-db"