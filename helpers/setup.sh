#!/bin/bash

echo "Setting up node repos"
cd "$(dirname "$0")" || exit

. ../shared/repos.sh
. ../shared/variables.sh

cd ../../

for i in "${repositories[@]}"
do
  cd $i;
  echo $i;
  rm -r node_modules;
  rm package-lock.json
  npm i;
  cd ..
done
