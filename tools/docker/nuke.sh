#!/bin/bash

cd "$(dirname "$0")" || exit

docker system prune -a -f