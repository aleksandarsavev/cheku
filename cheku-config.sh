#!/bin/bash

PARENT=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )

read -e -p "Enter the user name which will be monitored: " USERNAME
echo "$USERNAME" > "$PARENT"/cheku-user

