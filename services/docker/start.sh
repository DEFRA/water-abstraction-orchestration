#!/bin/bash

cd "$(dirname "$0")" || exit

export REGISTRY="ghcr.io/defra"
export DEFAULT_TAG="develop"
export TAG="${1:-$DEFAULT_TAG}"

echo "Format branch to - separated"
TAG="${TAG//\//-}"
echo "TAG = $TAG"

GET_TAG() {
  # Check Tag exists if not default to default tag
  docker manifest inspect "$REGISTRY/$1:$TAG" > /dev/null \
  && echo $TAG || echo $DEFAULT_TAG
}

export WATER_SERVICE_API_TAG=$(GET_TAG "water-abstraction-service")
export WATER_INTERNAL_UI_TAG=$(GET_TAG "water-abstraction-ui/internal-ui")
export WATER_EXTERNAL_UI_TAG=$(GET_TAG "water-abstraction-ui/external-ui")
export WATER_IMPORT_API_TAG=$(GET_TAG "water-abstraction-import")
export WATER_REPORTING_API_TAG=$(GET_TAG "water-abstraction-reporting")
export WATER_RETURNS_API_TAG=$(GET_TAG "water-abstraction-returns")
export WATER_TACTICAL_CRM_API_TAG=$(GET_TAG "water-abstraction-tactical-crm")
export WATER_TACTICAL_IDM_API_TAG=$(GET_TAG "water-abstraction-tactical-idm")
export WATER_PERMIT_API_TAG=$(GET_TAG "water-abstraction-permit-repository")

export $(grep -v '^#' ../../secrets/.env | xargs)
export $(grep -v '^#' ../variables.env | xargs)

. ./variables.sh

echo "HOST --- ${REDIS_HOST}"

export COMPOSE_PROJECT_NAME="water-orchestration"
docker-compose pull
docker-compose up -d

# Branch: feat-pipeline-regression-tests