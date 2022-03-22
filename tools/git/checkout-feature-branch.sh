#!/bin/bash
cd "$(dirname "$0")" || exit

. ../../services/repos.sh

cd ../../../

ORGANIZATION="DEFRA"

ls

BRANCH="${1:-develop}"

for repository in "${repositories[@]}"
do
    cd $repository;
    git checkout $BRANCH > /dev/null 2>&1
    echo " Checking out: $(git branch --show-current) - $repository"
    cd ..
done