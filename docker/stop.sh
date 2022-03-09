#!/bin/bash

cd "$(dirname "$0")" || exit

. ./docker-variables.sh

docker-compose down
