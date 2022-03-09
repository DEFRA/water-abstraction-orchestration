#!/bin/bash

cd "$(dirname "$0")" || exit

. ./docker-variables.sh
. ../shared/secrets.sh
. ../docker/charge-secrets.sh

docker-compose up -d --build --force-recreate