#!/bin/bash

echo "PSQL - Set user"

export PGUSER=water_user
export PGDATABASE=permits

PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "SELECT 'CREATE DATABASE permits' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'permits')"
PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "CREATE SCHEMA IF NOT EXISTS permits AUTHORIZATION water_user;"