#!/usr/bin/env bash
# initialize a drupal environment using drush
umask 000

# load basic functions and project environment
. functions

echo "*************************************************************************************"
echo This will install a site with default values
echo "*************************************************************************************"

cd "$(projectdir)/www/docroot"
drush si \
    --db-url="mysql://${MYSQL_DRUPAL_USER}:${MYSQL_DRUPAL_PASSWORD}@mysql:3306/${MYSQL_DRUPAL_DB}"  \
    --db-su=root \
    --db-su-pw=${MYSQL_ROOT_PASSWORD} \
    --site-name=${SITE_NAME}  \
    --account-name=${ADMIN_USER} \
    --account-pass=${ADMIN_PASSWORD}

# Open browser
# URL="http://$APACHE_HOSTNAME/user/login?destination=/admin/reports/status"
# [[ -x $BROWSER ]] && exec "$BROWSER" "$URL"
# path=$(which xdg-open || which kde-open || which gnome-open) &&  $path "$URL" && exit
# echo "Can't find browser"
