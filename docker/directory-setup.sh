#!/usr/bin/env bash

. functions

# prepare the directories to set ownership and access rights and to avoid scripts complaining about missing folders
old_umask=$(umask)
umask 000
mkdir "${projectdir}/.drush" 2> /dev/null
mkdir "${projectdir}/.log" 2> /dev/null
mkdir "${projectdir}/.mysql" 2> /dev/null
mkdir "${projectdir}/.sendmail" 2> /dev/null
mkdir -p "${projectdir}/www/tmp" 2> /dev/null # To be used by temporary files in Drupal
## This must be created before running startup.sh, by Composer project template
## or manually if importing an existing project.
# mkdir "${projectdir}/drupal/web" 2> /dev/null # Composer Drupal installation directory
mkdir -p "${projectdir}/drupal/config/default/sync" 2> /dev/null # Config files for Drupal 8 (not accessible by the browser!)
mkdir -p "${projectdir}/www/private/default/files" 2> /dev/null # private files go here (not accessible by the browser!)
umask "${old_umask}"
