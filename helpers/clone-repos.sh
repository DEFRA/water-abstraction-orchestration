#!/bin/bash
cd "$(dirname "$0")" || exit

. ../shared/repos.sh

cd ../../

ORGANIZATION="DEFRA"

for repository in "${repositories[@]}"
do
    echo "#################### $repository ####################"
    git clone git@github.com:$ORGANIZATION/$repository.git
done