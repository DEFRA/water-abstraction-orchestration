#!/bin/bash

echo "Setting up node repos"
cd "$(dirname "$0")" || exit

. ./repos.sh
. ./variables.sh

cd ../../

for i in "${repositories[@]}"
do
  cd $i;
  echo $i;
  npm ci
  cd ..
done
