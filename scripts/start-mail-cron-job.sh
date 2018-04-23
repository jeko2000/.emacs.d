#!/bin/bash
SPOOL_DIR=/var/spool/cron

echo "*/2 * * * * /usr/bin/offlineimap >> $HOME/mail/logs/offlineimap.log" > $SPOOL_DIR/$USER
