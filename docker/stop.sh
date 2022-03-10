#!/bin/bash

cd "$(dirname "$0")" || exit

export $(grep -v '^#' .env.docker | xargs)

docker-compose down
