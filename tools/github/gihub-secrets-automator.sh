#!/bin/bash

cd "$(dirname "$0")" || exit

echo "Taking secrets from .env and adding to github repo"
gh secret set test_scret --env-file ../secrets.env
gh secret set test_scret --env-file ../secrets.env.charge
