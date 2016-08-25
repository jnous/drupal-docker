#!/usr/bin/env bash
# Will get template from https://github.com/drupal-composer/drupal-project into ../drupal.

umask 000

# load basic functions and project environment
. functions

composer_project="$(projectdir)/drupal"

## Composer project initialization will fail if $composer_project is not empty.
echo "Initializing Composer project in ${composer_project}..."
composer create-project drupal-composer/drupal-project:8.x-dev "${composer_project}" --stability dev --no-interaction
