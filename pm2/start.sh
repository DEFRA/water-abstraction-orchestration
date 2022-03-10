#!/bin/bash

echo "Starting the Water Services"

npm list -g | grep pm2 ||  npm install pm2 -g

cd "$(dirname "$0")" || exit

export $(grep -v '^#' ../secrets/.env | xargs)
export $(grep -v '^#' ../shared/variables.env | xargs)

. ../shared/repos.sh

pm2 delete all

cd ../../

for i in "${repositories[@]}"
do
  cd $i;
  echo $i;
  pm2 start ecosystem.config.json;
  printf "\n----------------------------------------\n";
  cd ..
done

pm2 save