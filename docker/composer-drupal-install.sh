#!/usr/bin/env bash
# Install Drupal based on composer.json in ../drupal/.

umask 000

# load basic functions and project environment
. functions

composer_project="$(projectdir)/drupal"

cd "${composer_project}"
composer install

# Via www/docroot symlink
docroot="$(projectdir)/docroot"

cd "${docroot}"
# make some folders
folders="sites/default/files modules/contrib themes/contrib libraries modules/custom modules/features themes/custom"
for i in ${folders}; do
  mkdir ${i} 2> /dev/null
done

# prepare settings.php
cp -p sites/default/default.settings.php sites/default/settings.php
echo "\$settings[\"file_private_path\"] = \"/var/www/private/default/files\";" >> sites/default/settings.php
echo "\$settings[\"file_temporary_path\"] = \"/var/www/tmp\";" >> sites/default/settings.php
echo "\$config_directories[\"sync\"] = \"/srv/drupal/default/sync\";" >> sites/default/settings.php
