#!/bin/bash

echo "PSQL - Create Schema if not exists"
PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "CREATE SCHEMA IF NOT EXISTS idm"
PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "CREATE SCHEMA IF NOT EXISTS crm"
PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "CREATE SCHEMA IF NOT EXISTS crm_v2"
PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "CREATE SCHEMA IF NOT EXISTS import"
PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "CREATE SCHEMA IF NOT EXISTS permit"
PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "CREATE SCHEMA IF NOT EXISTS returns"
PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "CREATE SCHEMA IF NOT EXISTS water"
PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "CREATE SCHEMA IF NOT EXISTS water_import"