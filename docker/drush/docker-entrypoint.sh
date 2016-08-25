#!/usr/bin/env bash
# set umask for root to make the files created by Drush be editable by all
# and then call Drush
umask 000
/usr/local/bin/drush "${@}"
