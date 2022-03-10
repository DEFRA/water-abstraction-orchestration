#!/bin/bash
. ../shared/repos.sh

cd "$(dirname "$0")" || exit

read -p "Enter your project root path (e.g. ../../): " rootDir

rootDir=${rootDir:-"../../"}

echo "Using $rootDir as root path"
echo "Taking secrets from .env files and adding them to Github repo Action Secrets"


# For each WRLS repo, load the shared secrets
for repository in "${repositories[@]}"
do
    echo "#################### $repository ####################"
    cd $rootDir+$repository
    gh secret set test_scret --env-file $rootDir"water-abstraction-orchestration/secrets/.env.water"
done

# Additionally, the water service repo needs the charge module secrets!
cd $rootDir+"water-abstraction-service"
gh secret set test_scret --env-file $rootDir"water-abstraction-orchestration/secrets/.env.charge"
