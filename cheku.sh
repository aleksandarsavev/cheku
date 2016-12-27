#!/bin/bash

# Infinite script CHECKU (C) 2016
#
# The script checks repeatedly for the login sessions of a given user.

# Path variables
INSTALL="/root/hw6"
USERFILE="$INSTALL/cheku-user"
USERFOUNDFILE="$INSTALL/checku-found"
USERFOUNDOLDFILE="$INSTALL/checku-found-old"

# Sleep time. This is the loop period for each check.
SLEEP=5

USER=$(<$USERFILE)

while true
do
    if [ -e "$USERFOUNDFILE" ]
    then
        mv "$USERFOUNDFILE" "$USERFOUNDOLDFILE"
    fi
    
    lastlog | grep "^$USER " > $USERFOUNDFILE
    
    if [ -e "$USERFOUNDOLDFILE" ]
    then
        LOG=$(<$USERFOUNDFILE)
        LOG_OLD=$(<$USERFOUNDOLDFILE)
        if [ "$LOG" != "$LOG_OLD" ]
        then
            logger -p daemon.info "User [$USER] has logged into the system! [$LOG]"
        fi
    fi

    sleep $SLEEP
done

