#!/bin/bash

echo "PSQL - S130U issue"

export PGUSER=water_user
export PGDATABASE=permits

PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "INSERT INTO water.financial_agreement_types (financial_agreement_code, description)
                                                                 VALUES
                                                                 ('S130U', 'Section 130 BW Unsupported');"

