#!/bin/bash

echo "PSQL - test setup issues"

export PGUSER=water_user
export PGDATABASE=permits

# Fixes - license agreement test
PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "INSERT INTO water.financial_agreement_types (financial_agreement_code, description)
                                                                 VALUES
                                                                 ('S130U', 'Section 130 BW Unsupported');"
# Fixes - SROC test
PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "INSERT INTO water.billing_charge_categories(
                                                                 	reference, subsistence_charge, description, short_description, is_tidal, loss_factor, model_tier, is_restricted_source, min_volume, max_volume, date_created)
                                                                 	VALUES ('4.3.5', 500, 'test description', 'High loss, tidal, greater than 75 up to and including 250 ML/yr, Tier 1 model', true, 'high', 'tier 1', false, 10, 200, now());"

PGPASSWORD=password psql -h localhost -p 5432 -U water_user -tc "INSERT INTO water.billing_supported_sources (billing_supported_source_id,reference,\"name\",date_created,date_updated,\"order\",region) VALUES
                                                                 	 ('dc6bc727-777d-44bc-8fe3-f992cbdaee63'::uuid,'SS.1.3','Earl Soham - Deben','2021-11-19 12:00:06.615','2022-03-16 18:46:15.150',1,'Anglian'),
                                                                 	 ('856946d8-47f0-43ba-b62b-1c41993c4b05'::uuid,'SS.1.4','Glen Groundwater','2021-11-19 12:00:06.649','2022-03-16 18:46:15.155',2,'Anglian'),
                                                                 	 ('3c91f22c-5575-4727-a8cf-ff186dc111ec'::uuid,'SS.1.5','Great East Anglian Groundwater','2021-11-19 12:00:06.672','2022-03-16 18:46:15.163',3,'Anglian'),
                                                                 	 ('21b6f862-239d-458d-9593-56ad12a1a14c'::uuid,'SS.1.6','Great East Anglian Surface Water','2021-11-19 12:00:06.705','2022-03-16 18:46:15.168',4,'Anglian'),
                                                                 	 ('405edf72-1e5c-4e2e-8019-1f0590ad490d'::uuid,'SS.1.8','Lodes Granta Groundwater','2021-11-19 12:00:06.765','2022-03-16 18:46:15.174',5,'Anglian'),
                                                                 	 ('e5bffcf3-2bc7-4a46-a2d5-8d666aae92cf'::uuid,'SS.1.11','Nene – Northampton','2021-11-19 12:00:06.841','2022-03-16 18:46:15.178',6,'Anglian'),
                                                                 	 ('be77f85b-16b8-4384-9b29-32e8d903e36f'::uuid,'SS.1.12','Nene – Water Newton','2021-11-19 12:00:06.874','2022-03-16 18:46:15.181',7,'Anglian'),
                                                                 	 ('f863ad5c-f846-4ec3-a177-f4dea5083464'::uuid,'SS.1.13','Ouse – Eaton Socon','2021-11-19 12:00:06.896','2022-03-16 18:46:15.185',8,'Anglian'),
                                                                 	 ('5a021f53-e27d-4eb8-a3eb-5f7ae98efcd5'::uuid,'SS.1.14','Ouse – Hermitage','2021-11-19 12:00:06.930','2022-03-16 18:46:15.188',9,'Anglian'),
                                                                 	 ('9f126dff-50bd-4185-8383-f7d4df3a13d4'::uuid,'SS.1.15','Ouse - Offord','2021-11-19 12:00:06.951','2022-03-16 18:46:15.192',10,'Anglian'),
                                                                 	 ('dfad64d8-7468-4a58-857b-4d2db6f1e6c4'::uuid,'SS.1.16','Rhee Groundwater','2021-11-19 12:00:06.986','2022-03-16 18:46:15.234',11,'Anglian'),
                                                                 	 ('d3009d92-64e9-437c-9fd2-f28ee139e7dc'::uuid,'SS.1.19','Thet and Little Ouse Surface Water','2021-11-19 12:00:07.077','2022-03-16 18:46:15.261',12,'Anglian');"


