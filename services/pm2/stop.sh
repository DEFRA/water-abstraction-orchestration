#!/bin/bash

echo "Stopping the Water Services"
cd "$(dirname "$0")" || exit

. ../repos.sh

cd ../../../

for i in "${repositories[@]}"
do
  cd $i;
  echo $i;
  pm2 stop ecosystem.config.json;
  printf "\n----------------------------------------\n";
  cd ..
done

pm2 save