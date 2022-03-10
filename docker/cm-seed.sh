#!/bin/bash

cd "$(dirname "$0")" || exit

docker-compose exec app npm run seed-db