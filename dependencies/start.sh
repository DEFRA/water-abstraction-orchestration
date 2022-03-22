#!/bin/bash

cd "$(dirname "$0")" || exit

# Inject redis / wrls-db port and config to align

docker-compose up -d
