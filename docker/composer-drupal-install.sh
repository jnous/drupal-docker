#!/usr/bin/env bash
# Install Drupal based on composer.json in ../drupal/.

umask 000

# load basic functions and project environment
. functions

composer_project="$(projectdir)/drupal"

cd "${composer_project}"
composer install

# Via www/docroot symlink
docroot="$(projectdir)/www/docroot"

cd "${docroot}"
# make some folders
folders="web/sites/default/files web/modules/contrib web/themes/contrib web/libraries web/modules/custom web/modules/features web/themes/custom"
for i in ${folders}; do
  mkdir ${i} 2> /dev/null
done

# prepare settings.php
cp -p web/sites/default/default.settings.php web/sites/default/settings.php
echo "\$settings[\"file_private_path\"] = \"/var/www/private/default/files\";" >> web/sites/default/settings.php
echo "\$settings[\"file_temporary_path\"] = \"/var/www/tmp\";" >> web/sites/default/settings.php
echo "\$config_directories[\"sync\"] = \"/srv/drupal/default/sync\";" >> web/sites/default/settings.php

cd -
