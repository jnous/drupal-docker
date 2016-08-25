#!/usr/bin/env bash

# prepare the directories to set ownership and access rights and to avoid scripts complaining about missing folders
old_umask=$(umask)
umask 000
mkdir "${projectdir}/.drush" 2> /dev/null
mkdir "${projectdir}/.log" 2> /dev/null
mkdir "${projectdir}/.mysql" 2> /dev/null
mkdir "${projectdir}/.sendmail" 2> /dev/null
mkdir "${projectdir}/www" 2> /dev/null
## These should be created by Composer project template (or manually if importing an existing project)
# mkdir "${projectdir}/drupal" 2> /dev/null # Drupal Composer project directory
# mkdir "${projectdir}/drupal/web" 2> /dev/null # Drupal installation directory
mkdir "${projectdir}/www/tmp" 2> /dev/null # To be used by temporary files in Drupal
mkdir "${projectdir}/drupal/config" 2> /dev/null # Config files for Drupal 8 (not accessible by the browser!)
mkdir "${projectdir}/drupal/config/default" 2> /dev/null # similar to the sites structure
mkdir "${projectdir}/drupal/config/default/sync" 2> /dev/null
mkdir "${projectdir}/www/private" 2> /dev/null # private files go here (not accessible by the browser!)
mkdir "${projectdir}/www/private/default" 2> /dev/null # similar to the sites structure
mkdir "${projectdir}/www/private/default/files" 2> /dev/null
umask "${old_umask}"
