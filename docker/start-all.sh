#!/bin/bash

cd "$(dirname "$0")" || exit

. ./docker-variables.sh

docker-compose -f docker-compose.yml -f docker-compose.services.yml  up