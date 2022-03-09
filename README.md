# Water Orchestration

[Pipeline Documentation](docs/pipeline.md)

Water orchestration is a project to run the water services locally and in a pipeline.
It provides a set of script to set up the and tear down different aspects of the system.

## Description

Docker vs PM2 - Currently, supporting PM2 with a view to containerise the application and run them using a script

## Getting Started

Use the scripts provided to manage / maintain your local instance.

The scripts in this project loop over the repository array found here: `/shared/repos.sh`

## Dependencies

- Repositories
    - `water-abstraction-permit-repository`
    - `water-abstraction-service`
    - `water-abstraction-tactical-crm`
    - `water-abstraction-tactical-idm`
    - `water-abstraction-ui`
    - `water-abstraction-returns`
    - `water-abstraction-import`
    - `water-abstraction-reporting`
- Databases
    - Postgres
- Other
    - Node
    - Docker

## Setup

### Helper - Clone repositories
```bash
# Pull relevant repos from the DEFRA organisation
sh helpers/clone-repos.sh
```

### Helper - Install node modules
```bash
# Install node dependencies
sh helpers/setup.sh
```

## Setup run time dependencies
> Start the databases and other dependecies found in the `docker/docker-compose.yml`
```bash
sh docker/start.sh
```

## Run the complete service

### Migrate data
> WIP

### PM2
> All repos need to be cloned and node modules installed
```bash
sh pm2/start.sh
```

### Secrets
Secret are kept secret. This service will not work without them.

## Help
```
Reach out to the water team
```



