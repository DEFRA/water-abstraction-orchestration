#!/bin/bash

echo "Starting the Water Services"
cd "$(dirname "$0")" || exit

. ../shared/repos.sh
. ../shared/variables.sh

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