#!/bin/bash

# Infinite script CHECKU (C) 2016
#
# The script checks repeatedly for the login sessions of a given user.

# Path variables
PARENT=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
USERFILE="$PARENT/cheku-user"

# Sleep time. This is the loop period for each check.
SLEEP=5

USER=$(<$USERFILE)
LOG=""
LOG_OLD=""

while true
do
    LOG_OLD="$LOG"
    LOG=`lastlog -u $USER | grep "^$USER"`
    
    if [ "$LOG" != "$LOG_OLD" ]
    then
        logger -p daemon.info "User [$USER] has logged into the system! [$LOG]"
    fi

    sleep $SLEEP
done
