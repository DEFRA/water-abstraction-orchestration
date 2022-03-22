#!/bin/bash
cd "$(dirname "$0")" || exit

. ../../services/repos.sh

cd ../../../

for repository in "${repositories[@]}"
do
    echo "#################### $repository ####################"
    cd "$repository" || exit
    git stash
    git checkout develop
    git fetch origin
    git reset --hard origin/develop
    git clean -d -f
    git pull
    cd - > /dev/null || exit
done
