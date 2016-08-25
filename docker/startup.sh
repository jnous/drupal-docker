#!/usr/bin/env bash

# create the environment file for Docker
# NB: env executes environment instead of sourcing, so it needs exec permissions.
env -i ./environment | sort > .environment.env

echo "COMPOSE_OPTIONS ============================"
cat .environment.env

# load functions and environment variables
. functions
. directory-setup.sh

# start docker containers
export COMPOSE_OPTIONS="--env-file=.environment.env"
docker-compose --project-name "$PROJECT_NAME" up

# cleanup
rm .environment.env 2> /dev/null
