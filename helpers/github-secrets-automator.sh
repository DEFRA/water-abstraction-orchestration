#!/bin/bash

cd "$(dirname "$0")" || exit

read -p "Enter your project root path (e.g. ../../): " rootDir

rootDir=${rootDir:-"../../"}

echo "Using $rootDir as root path"
echo "Taking secrets from .env files and adding them to Github repo Action Secrets"

cd $rootDir+"water-abstraction-service"
gh secret set test_scret --env-file $rootDir"water-abstraction-orchestration/secrets/.env.water-api"
gh secret set test_scret --env-file $rootDir"water-abstraction-orchestration/secrets/.env.charge"

cd $rootDir+"water-abstraction-ui"
gh secret set test_scret --env-file $rootDir"water-abstraction-orchestration/secrets/.env.water-ui"

cd $rootDir+"water-abstraction-returns"
gh secret set test_scret --env-file $rootDir"water-abstraction-orchestration/secrets/.env.water-returns"

cd $rootDir+"water-abstraction-permit-repository"
gh secret set test_scret --env-file $rootDir"water-abstraction-orchestration/secrets/.env.water-permit-repo"

cd $rootDir+"water-abstraction-import"
gh secret set test_scret --env-file $rootDir"water-abstraction-orchestration/secrets/.env.water-import"

cd $rootDir+"water-abstraction-reporting"
gh secret set test_scret --env-file $rootDir"water-abstraction-orchestration/secrets/.env.water-reporting"

cd $rootDir+"water-abstraction-tactical-crm"
gh secret set test_scret --env-file $rootDir"water-abstraction-orchestration/secrets/.env.water-crm"

cd $rootDir+"water-abstraction-tactical-idm"
gh secret set test_scret --env-file $rootDir"water-abstraction-orchestration/secrets/.env.water-idm"
