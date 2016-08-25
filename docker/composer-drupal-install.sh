#!/usr/bin/env bash
# Install Drupal based on composer.json in ../drupal/.

umask 000

# load basic functions and project environment
. functions

composer_project="$(projectdir)/drupal"

cd "${composer_project}"
composer install
cd -

# Via www/docroot symlink
docroot="$(projectdir)/drupal/web"

# make some folders
folders="sites/default/files modules/contrib themes/contrib libraries modules/custom modules/features themes/custom"
for i in ${folders}; do
  mkdir "${docroot}/${i}" 2> /dev/null
done

# prepare settings.php
cp -p "${docroot}"/sites/default/default.settings.php "${docroot}"/sites/default/settings.php
echo "\$settings[\"file_private_path\"] = \"/var/www/private/default/files\";" >> "${docroot}"/sites/default/settings.php
echo "\$settings[\"file_temporary_path\"] = \"/var/www/tmp\";" >> "${docroot}"/sites/default/settings.php
echo "\$config_directories[\"sync\"] = \"/srv/drupal/default/sync\";" >> "${docroot}"/sites/default/settings.php
