#!/bin/bash

echo "PSQL - Configure"

# This need to be set locally - check migration
#export PGUSER=water_user
#export PGHOST=localhost
#export PGPASSWORD=password
#export PGPORT=5432
#export PGDATABASE=permits

PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "CREATE EXTENSION pgcrypto;"
PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "CREATE ROLE root WITH SUPERUSER CREATEDB CREATEROLE LOGIN;"
PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "GRANT USAGE ON SCHEMA public TO water_user;"
PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "set search_path = public, water, idm;"