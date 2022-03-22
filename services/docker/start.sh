#!/bin/bash

cd "$(dirname "$0")" || exit

export REGISTRY="ghcr.io/defra"
export DEFAULT_TAG="develop"
export TAG="${1:-$DEFAULT_TAG}"

echo "TAG = $TAG"

GET_TAG() {
  # Check Tag exists if not default to default tag
  docker manifest inspect "$REGISTRY/$1:$TAG" > /dev/null \
  && echo $TAG || echo $DEFAULT_TAG
}

export WATER_SERVICE_API_TAG=$(GET_TAG "water-abstraction-service")
export COMPOSE_PROJECT_NAME="water-orchestration"

export $(grep -v '^#' ../..//secrets/.env | xargs)
export $(grep -v '^#' ../variables.env | xargs)

. ./variables.sh

echo "HOST --- ${REDIS_HOST}"

docker-compose up -d

# Branch: feat-pipeline-regression-tests