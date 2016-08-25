#!/bin/bash
# Build necessary images on first run.

cd docker/drupalconsole
. build.sh
cd -
cd docker/drush
. build.sh
cd -
cd docker/node.js
. build.sh
cd -
cd docker/Ubuntu_16.04
. build.sh
cd -
