#!/bin/bash

cd "$(dirname "$0")" || exit

declare -a arr=(
"water-abstraction-permit-repository"
"water-abstraction-service"
"water-abstraction-tactical-crm"
"water-abstraction-tactical-idm"
"water-abstraction-returns"
"water-abstraction-import"
)

cd ../../

export $(grep -v '^#' ../secrets/.env | xargs)
export $(grep -v '^#' ../shared/variables.env | xargs)

for i in "${arr[@]}"
do
  cd $i;
  echo $i;
  npm run migrate
  printf "\n----------------------------------------\n";
  cd ..
done