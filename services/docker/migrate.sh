#!/bin/bash

cd "$(dirname "$0")" || exit

declare -a arr=(
  "water-abstraction-service"
  "water-abstraction-returns"
  "water-abstraction-tactical-crm"
  "water-abstraction-tactical-idm"
  "water-abstraction-permit-repository"
  "water-abstraction-import"
)

for i in "${arr[@]}"
do
  docker exec "${i}-api" npm run migrate
done