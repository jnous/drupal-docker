#!/bin/bash
# Build necessary images on first run.

. docker/drupalconsole/build.sh
. docker/drush/build.sh
. docker/node.js/build.sh
. docker/Ubuntu_16.04/build.sh
