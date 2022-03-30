
# Water Orchestration

Water orchestration is a project to run the water services locally and in a pipeline.  
This project supplies all the relevant scripts to stand up the water abstraction system locally and in a pipeline.

This project also holds the common GitHub actions used by all repositories.

## Description

This project provides scripts to:
- clone all relevant repositories, install node modules
- start dependencies (Database, Redis, charge module) in docker
- start services with PM2
- start services with Docker

## Getting Started

This getting started section follows the regression test pipeline setup here: [Regression GitHub Action](https://github.com/DEFRA/water-abstraction-ui/blob/develop/.github/workflows/regression.yml)

**You will need the secrets' env files**

> Pull all relevant repositories
```bash
bash tools/git/clone-repos.sh
```
> Install node modules in all repos
```bash
bash tools/node/install-node-modules.sh  
```
> Start the databases, redis and charge module with Docker
```bash
bash dependencies/start.sh
```
> Set up the WRLS Database
```bash
bash dependencies/database/configure-psql.sh  
bash dependencies/database/setup-user.sh  
bash dependencies/database/create-schema.sh
```
>  Set up the Charge Module - ! Only migrate locally once
```bash
bash dependencies/charge-module/migrate.sh  
bash dependencies/charge-module/seed.sh
```

---
> Start with Docker  - ! You will need a [GitHub PAT (read:packages)](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
```bash
# Pass in your branch or defaults to develop
bash services/docker/start.sh <your-branch>
```
> Migrate with Docker
```bash 
bash services/docker/migrate.sh
```

Or

> Start with PM2
```bash
bash services/pm2/start.sh
```
> Migrate with node
```bash 
bash services/node-migrate.sh
```

## Dependencies

Repositories
- `water-abstraction-permit-repository`
- `water-abstraction-service`
- `water-abstraction-tactical-crm`
- `water-abstraction-tactical-idm`
- `water-abstraction-ui`
- `water-abstraction-returns`
- `water-abstraction-import`
- `water-abstraction-reporting`

Databases
- Postgres

Other
- Node
- Docker