#!/bin/bash

echo "Setting up node repos"
cd "$(dirname "$0")" || exit

. ../../services/repos.sh
export $(grep -v '^#' ../../services/variables.env | xargs)

cd ../../../

for i in "${repositories[@]}"
do
  cd $i;
  echo $i;
  npm ci
  cd ..
done
