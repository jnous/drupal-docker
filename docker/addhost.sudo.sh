#!/usr/bin/env bash
# Script to add/remove the project's hosts to/from /etc/hosts
# If a host's IP is empty, it's entry is removed from /etc/hosts

. environment > /dev/null

HOSTSNEW=../www/tmp/hosts
HOSTS=/etc/hosts
# Just to be sure, make a backup.
sudo cp $HOSTS $HOSTS.ddd-backup
cat $HOSTS > ${HOSTSNEW}
rm ${HOSTSNEW}.tmp 2> /dev/null

if [ ! -z "$APACHE_HOSTNAME" ]
    then
    grep -v "$APACHE_HOSTNAME" $HOSTSNEW > ${HOSTSNEW}.tmp
    mv ${HOSTSNEW}.tmp $HOSTSNEW
    if [ ! -z "$APACHE_IP" ]
        then
        echo "$APACHE_IP" "$APACHE_HOSTNAME" >> ${HOSTSNEW}
    fi
fi

if [ ! -z "$MYSQL_HOSTNAME" ]
    then
    grep -v "$MYSQL_HOSTNAME" $HOSTSNEW > ${HOSTSNEW}.tmp
    mv ${HOSTSNEW}.tmp $HOSTSNEW
    if [ ! -z "$MYSQL_IP" ]
        then
        echo "$MYSQL_IP" "$MYSQL_HOSTNAME" >> ${HOSTSNEW}
    fi
fi

echo "New $HOSTS file:"
cat $HOSTSNEW | sudo tee $HOSTS
rm $HOSTSNEW
