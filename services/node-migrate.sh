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

export $(grep -v '^#' ../secrets/.env | xargs)
export $(grep -v '^#' ./variables.env | xargs)

cd ../../

for i in "${arr[@]}"
do
  cd $i;
  echo $i;
  npm run migrate
  printf "\n----------------------------------------\n";
  cd ..
done